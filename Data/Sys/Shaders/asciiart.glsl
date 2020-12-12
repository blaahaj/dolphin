// HLSL doesn't like constant expressions that aren't literals
#define char_width 8u
#define char_height 13u
#define char_count 95u
#define char_pixels (char_width*char_height)

#if !API_OPENGL && !API_VULKAN
// HLSL
#define BEGIN_ARRAY_INIT(type) {
#define END_ARRAY_INIT }
#else
// GLSL
#define BEGIN_ARRAY_INIT(type) type[](
#define END_ARRAY_INIT )
#endif

const uint4 chars[char_count] = BEGIN_ARRAY_INIT(uint4)
	uint4(0x00000000u, 0x00000000u, 0x00000000u, 0x00000000u),
	uint4(0x18000000u, 0x18181818u, 0x00001818u, 0x00001818u),
	uint4(0x6c000000u, 0x006c6c6cu, 0x00000000u, 0x00000000u),
	uint4(0x00000000u, 0xff666600u, 0x66ff6666u, 0x00000066u),
	uint4(0x18000000u, 0x1f1bff7eu, 0xffd8f87eu, 0x0000187eu),
	uint4(0x0e000000u, 0x306edb1bu, 0xdb760c18u, 0x000070d8u),
	uint4(0x1c000000u, 0x1b333336u, 0xf31b0e0eu, 0x0000fe63u),
	uint4(0x70000000u, 0x00183830u, 0x00000000u, 0x00000000u),
	uint4(0x30000000u, 0x0c0c0c18u, 0x0c0c0c0cu, 0x00003018u),
	uint4(0x0c000000u, 0x30303018u, 0x30303030u, 0x00000c18u),
	uint4(0x00000000u, 0x3c5a9900u, 0x995a3cffu, 0x00000000u),
	uint4(0x00000000u, 0x18181800u, 0x1818ffffu, 0x00000018u),
	uint4(0x00000000u, 0x00000000u, 0x38380000u, 0x00000c18u),
	uint4(0x00000000u, 0x00000000u, 0x0000ffffu, 0x00000000u),
	uint4(0x00000000u, 0x00000000u, 0x1c000000u, 0x0000001cu),
	uint4(0xc0000000u, 0x306060c0u, 0x0c181830u, 0x0006060cu),
	uint4(0x3c000000u, 0xf3e3c366u, 0xc3c7cfdbu, 0x00003c66u),
	uint4(0x18000000u, 0x18181e1cu, 0x18181818u, 0x00007e18u),
	uint4(0x7e000000u, 0x3060c0e7u, 0x03060c18u, 0x0000ff03u),
	uint4(0x7e000000u, 0xe0c0c0e7u, 0xc0c0e07eu, 0x00007ee7u),
	uint4(0x30000000u, 0x33363c38u, 0x303030ffu, 0x00003030u),
	uint4(0xff000000u, 0x03030303u, 0xc0c0e07fu, 0x00007ee7u),
	uint4(0x7e000000u, 0x030303e7u, 0xc3c3e37fu, 0x00007ee7u),
	uint4(0xff000000u, 0x60c0c0c0u, 0x0c0c1830u, 0x00000c0cu),
	uint4(0x7e000000u, 0xe7c3c3e7u, 0xc3c3e77eu, 0x00007ee7u),
	uint4(0x7e000000u, 0xe7c3c3e7u, 0xc0c0c0feu, 0x00007ee7u),
	uint4(0x00000000u, 0x1c000000u, 0x1c00001cu, 0x0000001cu),
	uint4(0x00000000u, 0x38380000u, 0x38380000u, 0x00000c18u),
	uint4(0x60000000u, 0x060c1830u, 0x180c0603u, 0x00006030u),
	uint4(0x00000000u, 0xff000000u, 0xffff00ffu, 0x00000000u),
	uint4(0x06000000u, 0x6030180cu, 0x183060c0u, 0x0000060cu),
	uint4(0x7e000000u, 0x60c0c3c3u, 0x00181830u, 0x00001800u),
	uint4(0x00000000u, 0xc37e0000u, 0xf3dbcbbbu, 0x0000fc06u),
	uint4(0x18000000u, 0xc3c3663cu, 0xc3c3ffc3u, 0x0000c3c3u),
	uint4(0x7f000000u, 0xe3c3c3e3u, 0xc3c3e37fu, 0x00007fe3u),
	uint4(0x7e000000u, 0x030303e7u, 0x03030303u, 0x00007ee7u),
	uint4(0x3f000000u, 0xc3c3e373u, 0xe3c3c3c3u, 0x00003f73u),
	uint4(0xff000000u, 0x03030303u, 0x0303033fu, 0x0000ff03u),
	uint4(0xff000000u, 0x3f030303u, 0x03030303u, 0x00000303u),
	uint4(0x7e000000u, 0x030303e7u, 0xc3c3f303u, 0x00007ee7u),
	uint4(0xc3000000u, 0xc3c3c3c3u, 0xc3c3c3ffu, 0x0000c3c3u),
	uint4(0x7e000000u, 0x18181818u, 0x18181818u, 0x00007e18u),
	uint4(0x60000000u, 0x60606060u, 0x63606060u, 0x00003e77u),
	uint4(0xc3000000u, 0x0f1b3363u, 0x331b0f07u, 0x0000c363u),
	uint4(0x03000000u, 0x03030303u, 0x03030303u, 0x0000ff03u),
	uint4(0xc3000000u, 0xdbffffe7u, 0xc3c3c3c3u, 0x0000c3c3u),
	uint4(0xc7000000u, 0xdfcfcfc7u, 0xf3f3fbdbu, 0x0000e3e3u),
	uint4(0x7e000000u, 0xc3c3c3e7u, 0xc3c3c3c3u, 0x00007ee7u),
	uint4(0x7f000000u, 0xe3c3c3e3u, 0x0303037fu, 0x00000303u),
	uint4(0x3c000000u, 0xc3c3c366u, 0xfbdbc3c3u, 0x0000fc76u),
	uint4(0x7f000000u, 0xe3c3c3e3u, 0x331b0f7fu, 0x0000c363u),
	uint4(0x7e000000u, 0x070303e7u, 0xc0c0e07eu, 0x00007ee7u),
	uint4(0xff000000u, 0x18181818u, 0x18181818u, 0x00001818u),
	uint4(0xc3000000u, 0xc3c3c3c3u, 0xc3c3c3c3u, 0x00007ee7u),
	uint4(0xc3000000u, 0xc3c3c3c3u, 0x3c6666c3u, 0x0000183cu),
	uint4(0xc3000000u, 0xc3c3c3c3u, 0xffffdbdbu, 0x0000c3e7u),
	uint4(0xc3000000u, 0x3c3c6666u, 0x663c3c18u, 0x0000c366u),
	uint4(0xc3000000u, 0x3c3c6666u, 0x18181818u, 0x00001818u),
	uint4(0xff000000u, 0x3060c0c0u, 0x03060c7eu, 0x0000ff03u),
	uint4(0x3c000000u, 0x0c0c0c0cu, 0x0c0c0c0cu, 0x00003c0cu),
	uint4(0x06000000u, 0x180c0c06u, 0x60303018u, 0x00c0c060u),
	uint4(0x3c000000u, 0x30303030u, 0x30303030u, 0x00003c30u),
	uint4(0x18000000u, 0x00c3663cu, 0x00000000u, 0x00000000u),
	uint4(0x00000000u, 0x00000000u, 0x00000000u, 0xffff0000u),
	uint4(0x0e000000u, 0x00181c0cu, 0x00000000u, 0x00000000u),
	uint4(0x00000000u, 0x7e000000u, 0xc3fec0c3u, 0x0000fec3u),
	uint4(0x03000000u, 0x03030303u, 0xc3c3c37fu, 0x00007fc3u),
	uint4(0x00000000u, 0x7e000000u, 0x030303c3u, 0x00007ec3u),
	uint4(0xc0000000u, 0xc0c0c0c0u, 0xc3c3c3feu, 0x0000fec3u),
	uint4(0x00000000u, 0x7e000000u, 0x037fc3c3u, 0x0000fe03u),
	uint4(0x78000000u, 0x0c0c0cccu, 0x0c0c0c3fu, 0x00000c0cu),
	uint4(0x00000000u, 0x7e000000u, 0xfec3c3c3u, 0x7ec3c0c0u),
	uint4(0x03000000u, 0x7f030303u, 0xc3c3c3c3u, 0x0000c3c3u),
	uint4(0x00000000u, 0x18000018u, 0x18181818u, 0x00001818u),
	uint4(0x00000000u, 0x30000030u, 0x30303030u, 0x1c363030u),
	uint4(0x03000000u, 0x63030303u, 0x1f0f1b33u, 0x00006333u),
	uint4(0x1e000000u, 0x18181818u, 0x18181818u, 0x00007e18u),
	uint4(0x00000000u, 0x7f000000u, 0xdbdbdbdbu, 0x0000dbdbu),
	uint4(0x00000000u, 0x3f000000u, 0x63636363u, 0x00006363u),
	uint4(0x00000000u, 0x3e000000u, 0x63636363u, 0x00003e63u),
	uint4(0x00000000u, 0x7f000000u, 0xc3c3c3c3u, 0x0303037fu),
	uint4(0x00000000u, 0xfe000000u, 0xc3c3c3c3u, 0xc0c0c0feu),
	uint4(0x00000000u, 0x7f000000u, 0x03030307u, 0x00000303u),
	uint4(0x00000000u, 0xfe000000u, 0xc07e0303u, 0x00007fc0u),
	uint4(0x00000000u, 0x3f0c0c0cu, 0x0c0c0c0cu, 0x0000386cu),
	uint4(0x00000000u, 0x63000000u, 0x63636363u, 0x00007e63u),
	uint4(0x00000000u, 0xc3000000u, 0x3c6666c3u, 0x0000183cu),
	uint4(0x00000000u, 0xc3000000u, 0xffdbc3c3u, 0x0000c3e7u),
	uint4(0x00000000u, 0xc3000000u, 0x3c183c66u, 0x0000c366u),
	uint4(0x00000000u, 0xc3000000u, 0x183c6666u, 0x0306060cu),
	uint4(0x00000000u, 0xff000000u, 0x0c183060u, 0x0000ff06u),
	uint4(0xf0000000u, 0x1c181818u, 0x18181c0fu, 0x0000f018u),
	uint4(0x18000000u, 0x18181818u, 0x18181818u, 0x18181818u),
	uint4(0x0f000000u, 0x38181818u, 0x181838f0u, 0x00000f18u),
	uint4(0x00000000u, 0x8f060000u, 0x000060f1u, 0x00000000u)
END_ARRAY_INIT;

const float2 char_dim = float2(char_width, char_height);

float4 FontChar(uint c, uint x, uint y)
{
	const uint word_size = 32u;
	const uint vec_dim = 4u;
	const uint padding_size = (word_size * vec_dim) - (char_width * char_height);

	// Needed for safety and may also improve performance.
	c = max(0u, min(char_count - 1u, c));
	x = max(0u, min(char_width - 1u, x));
	y = max(0u, min(char_height - 1u, y));

	uint4 char_bits = chars[c];
	uint bit = padding_size + (y * char_width + x);
	float val = float((char_bits[bit / word_size] >> (bit % word_size)) & 1u);
	return float4(val, val, val, val);
}

void main()
{
	float2 char_pos = floor(GetCoordinates()*GetResolution()/char_dim);
	float2 pixel_offset = floor(GetCoordinates()*GetResolution()) - char_pos*char_dim;

	// just a big number
	float mindiff = float(char_width*char_height) * 100.0;

	uint minc = 0u;
	float4 mina = float4(0.0, 0.0, 0.0, 0.0);
	float4 minb = float4(0.0, 0.0, 0.0, 0.0);

	for (uint i=0u; i<char_count; i++)
	{
		float4 ff = float4(0.0, 0.0, 0.0, 0.0);
		float4 f = float4(0.0, 0.0, 0.0, 0.0);
		float4 ft = float4(0.0, 0.0, 0.0, 0.0);
		float4 t = float4(0.0, 0.0, 0.0, 0.0);
		float4 tt = float4(0.0, 0.0, 0.0, 0.0);

		for (uint x=0u; x<char_width; x++)
		{
			for (uint y=0u; y<char_height; y++)
			{
				float2 tex_pos = char_pos*char_dim + float2(x,y) + 0.5;
				float4 tex = SampleLocation(tex_pos * GetInvResolution());

				float4 font = FontChar(i, x, y);

				// generates sum of texture and font and their squares
				ff += font*font;
				f += font;
				ft += font*tex;
				t += tex;
				tt += tex*tex;
			}
		}

		// The next lines are a bit harder, hf :-)

		// The idea is to find the perfect char with the perfect background color and the perfect font color.
		// As this is an equation with three unknowns, we can't just try all chars and color combinations.

		// As criterion how "perfect" the selection is, we compare the "mean squared error" of the resulted colors of all chars.
		// So, now the big issue: how to calculate the MSE without knowing the two colors ...

		// In the next steps, "a" is the font color, "b" is the background color, "f" is the font value at this pixel, "t" is the texture value

		// So the square error of one pixel is:
		// e = ( t - a⋅f - b⋅(1-f) ) ^ 2

		// In longer:
		// e = a^2⋅f^2 - 2⋅a⋅b⋅f^2 + 2⋅a⋅b⋅f - 2⋅a⋅f⋅t + b^2⋅f^2 - 2⋅b^2⋅f + b^2 + 2⋅b⋅f⋅t - 2⋅b⋅t + t^2

		// The sum of all errors is: (as shortcut, ff,f,ft,t,tt are now the sums like declared above, sum(1) is the count of pixels)
		// sum(e) = a^2⋅ff - 2⋅a^2⋅ff + 2⋅a⋅b⋅f - 2⋅a⋅ft + b^2⋅ff - 2⋅b^2⋅f + b^2⋅sum(1) + 2⋅b⋅ft - 2⋅b⋅t + tt

		// To find the minimum, we have to derive this by "a" and "b":
		// d/da sum(e) = 2⋅a⋅ff + 2⋅b⋅f - 2⋅b⋅ff - 2⋅ft
		// d/db sum(e) = 2⋅a⋅f - 2⋅a⋅ff - 4⋅b⋅f + 2⋅b⋅ff + 2⋅b⋅sum(1) + 2⋅ft - 2⋅t

		// So, both equations must be zero at minimum and there is only one solution.

		float4 a = (f*ft - ff*t + f*t - ft*float(char_pixels)) / (f*f  - ff*float(char_pixels));
		float4 b = (f*ft - ff*t) / (f*f  - ff*float(char_pixels));

		float4 diff = a*a*ff + 2.0*a*b*f - 2.0*a*b*ff - 2.0*a*ft + b*b *(-2.0*f + ff + float(char_pixels)) + 2.0*b*ft - 2.0*b*t + tt;
		float diff_f = dot(diff, float4(1.0, 1.0, 1.0, 1.0));

		if (diff_f < mindiff)
		{
			mindiff = diff_f;
			minc = i;
			mina = a;
			minb = b;
		}
	}

	float4 col = FontChar(minc, uint(pixel_offset.x), uint(pixel_offset.y));
	SetOutput(mina * col + minb * (float4(1.0,1.0,1.0,1.0) - col));
}
