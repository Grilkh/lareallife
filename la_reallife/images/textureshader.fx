texture Tex;
texture Tex2;
texture Tex3;
texture Tex4;
texture Tex5;
texture Tex6;
texture Tex7;
texture Tex8;
texture Tex9;
texture Tex10;

technique ltrlogo
{
    pass P0
    {
        Texture[0] = Tex;
		Texture[1] = Tex2;
		Texture[2] = Tex3;
		Texture[3] = Tex4;
		Texture[4] = Tex5;
		Texture[5] = Tex6;
		Texture[6] = Tex7;
		Texture[7] = Tex8;
		Texture[8] = Tex9;
		Texture[9] = Tex10;
		AlphaBlendEnable = TRUE;
    }
}
