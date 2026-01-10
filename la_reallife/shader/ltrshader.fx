texture Tex;

technique ltrlogo
{
    pass P0
    {
        Texture[0] = Tex;
		AlphaBlendEnable = TRUE;
    }
}
