#include "UDPWrapper.h"
#include "UDPWiimote.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include <wx/wx.h>
#include <wx/listbox.h>
#include <wx/textctrl.h>
#include <wx/button.h>
#include <wx/stattext.h>
#include <wx/combobox.h>
#include <wx/checkbox.h>
#include <wx/notebook.h>
#include <wx/panel.h>
#include <wx/spinctrl.h>

UDPWrapper::UDPWrapper(int indx, const char* const _name) : 
updIR(false),updAccel(false),
updButt(false),udpEn(false),inst(NULL),
index(indx),ControllerEmu::ControlGroup(_name,GROUP_TYPE_UDPWII)
{
	char s[5];
	sprintf(s,"%d",4432+index);
	port=s;
	//PanicAlert("UDPWrapper #%d ctor",index);
}


void UDPWrapper::LoadConfig(IniFile::Section *sec, const std::string& defdev, const std::string& base )
{
	ControlGroup::LoadConfig(sec,defdev,base);

	std::string group( base + name ); group += "/";

	int _updAccel,_updIR,_updButt,_udpEn;
	sec->Get((group + "Enable").c_str(),&_udpEn,0);

	char s[5];
	sprintf(s,"%d",4432+index);
	sec->Get((group + "Port").c_str(),&port,s);

	sec->Get((group + "Update_Accel").c_str(),&_updAccel,1);
	sec->Get((group + "Update_IR").c_str(),&_updIR,1);
	sec->Get((group + "Update_Butt").c_str(),&_updButt,1);

	udpEn=(_udpEn>0);
	updAccel=(_updAccel>0);
	updIR=(_updIR>0);
	updButt=(_updButt>0);

	Refresh();
}


void UDPWrapper::SaveConfig(IniFile::Section *sec, const std::string& defdev, const std::string& base )
{
	ControlGroup::SaveConfig(sec,defdev,base);
	std::string group( base + name ); group += "/";
	sec->Set((group + "Enable").c_str(),(int)udpEn);
	sec->Set((group + "Port").c_str(),port.c_str());
	sec->Set((group + "Update_Accel").c_str(),(int)updAccel);
	sec->Set((group + "Update_IR").c_str(),(int)updIR);
	sec->Set((group + "Update_Butt").c_str(),(int)updButt);
}


void UDPWrapper::Refresh()
{
	bool udpAEn=(inst!=NULL);
	if (udpEn&&udpAEn)
	{
		if (strcmp(inst->getPort(),port.c_str()))
		{
			delete inst;
			inst= new UDPWiimote(port.c_str());
		}
		return;
	}
	if (!udpEn)
	{
		if (inst)
			delete inst;
		inst=NULL;
		return;
	}
	//else
	inst= new UDPWiimote(port.c_str());
}

UDPWrapper::~UDPWrapper()
{
	if (inst)
		delete inst;
}


#define _connect_macro_(b, f, c, s)	(b)->Connect(wxID_ANY, (c), wxCommandEventHandler( f ), (wxObject*)0, (wxEvtHandler*)s)

class UDPConfigDiag : public wxDialog
{
public:
	UDPConfigDiag(wxWindow * const parent, UDPWrapper * _wrp);
	UDPWrapper * wrp;
	void ChangeUpdateFlags(wxCommandEvent & event);
	void ChangeState(wxCommandEvent & event);
	void OKPressed(wxCommandEvent & event);
	wxCheckBox * enable;
	wxCheckBox * butt;
	wxCheckBox * accel;
	wxCheckBox * point;
	wxTextCtrl * port_tbox;
};

UDPConfigDiag::UDPConfigDiag(wxWindow * const parent, UDPWrapper * _wrp) :
	  wxDialog(parent, -1, wxT("UDP Wiimote"), wxDefaultPosition, wxDefaultSize),
	  wrp(_wrp) 
{
	wxBoxSizer * outer_sizer = new wxBoxSizer(wxVERTICAL);
	wxBoxSizer * sizer1 = new wxBoxSizer(wxVERTICAL);
	wxBoxSizer * sizer2 = new wxBoxSizer(wxVERTICAL);
	outer_sizer ->Add(sizer1, 0, wxUP | wxLEFT| wxRIGHT | wxEXPAND, 10);
	outer_sizer ->Add(sizer2, 1, wxALL | wxEXPAND, 10);

	enable = new wxCheckBox(this,wxID_ANY,wxT("Enable"));
	butt = new wxCheckBox(this,wxID_ANY,wxT("Update Buttons"));
	accel = new wxCheckBox(this,wxID_ANY,wxT("Update Acceleration"));
	point = new wxCheckBox(this,wxID_ANY,wxT("Update IR Pointer"));

	wxButton * ok_butt = new wxButton(this,wxID_ANY,wxT("OK"));
	
	wxBoxSizer * port_sizer = new wxBoxSizer(wxHORIZONTAL);
	port_sizer->Add(new wxStaticText(this , wxID_ANY, wxT("UDP Port:")),0,wxALIGN_CENTER);
	port_tbox = new wxTextCtrl(this,wxID_ANY,wxString::FromUTF8(wrp->port.c_str()));
	port_sizer->Add(port_tbox,1, wxLEFT | wxEXPAND , 5);

	_connect_macro_(enable,UDPConfigDiag::ChangeState ,wxEVT_COMMAND_CHECKBOX_CLICKED, this);
	_connect_macro_(butt,UDPConfigDiag::ChangeUpdateFlags ,wxEVT_COMMAND_CHECKBOX_CLICKED, this);
	_connect_macro_(accel,UDPConfigDiag::ChangeUpdateFlags ,wxEVT_COMMAND_CHECKBOX_CLICKED, this);
	_connect_macro_(point,UDPConfigDiag::ChangeUpdateFlags ,wxEVT_COMMAND_CHECKBOX_CLICKED, this);
	_connect_macro_(ok_butt,UDPConfigDiag::OKPressed, wxEVT_COMMAND_BUTTON_CLICKED, this);
	_connect_macro_(port_tbox, UDPConfigDiag::ChangeState, wxEVT_COMMAND_TEXT_UPDATED, this);

	enable->SetValue(wrp->udpEn);
	butt->SetValue(wrp->updButt);
	accel->SetValue(wrp->updAccel);
	point->SetValue(wrp->updIR);

	sizer1->Add(enable,1,wxALL | wxEXPAND,5);
	sizer1->Add(port_sizer, 1,wxDOWN | wxLEFT| wxRIGHT | wxEXPAND,5);

	sizer2->Add(butt,1,wxALL | wxEXPAND,5);
	sizer2->Add(accel,1,wxALL | wxEXPAND,5);
	sizer2->Add(point,1,wxALL | wxEXPAND,5);

	outer_sizer->Add(ok_butt,0, wxDOWN | wxLEFT| wxRIGHT | wxALIGN_RIGHT,10);

	SetSizerAndFit(outer_sizer);
	Layout();
}

void UDPConfigDiag::ChangeUpdateFlags(wxCommandEvent & event)
{
	wrp->updAccel=accel->GetValue();
	wrp->updButt=butt->GetValue();
	wrp->updIR=point->GetValue();
}

void UDPConfigDiag::ChangeState(wxCommandEvent & event)
{
	wrp->udpEn=enable->GetValue();
	wrp->port=port_tbox->GetValue().mb_str(wxConvUTF8);
	wrp->Refresh();
}

void UDPConfigDiag::OKPressed(wxCommandEvent & event)
{
	Close();
}

void UDPWrapper::Configure(wxWindow * parent)
{
	wxDialog * diag = new UDPConfigDiag(parent,this);
	diag->ShowModal();
	diag->Destroy();
}