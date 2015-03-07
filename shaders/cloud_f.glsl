//GLSL
#version 110

uniform sampler2D p3d_Texture0;

varying float blend;
varying float h;

uniform vec4 cloudColor;
uniform vec4 sky;
uniform vec4 fog;

void main()
    { 
    vec4 tex1=texture2D(p3d_Texture0,gl_TexCoord[0].xy);
    vec4 tex2=texture2D(p3d_Texture0,gl_TexCoord[1].xy);
    vec4 out_color=mix(fog*1.05, sky, h); 
    vec4 cloud=((cloudColor-out_color)*(tex1.r*tex2.r)*blend)*cloudColor.a;
    out_color+=cloud;    
    out_color.a=1.0;
    gl_FragData[0]=out_color;
    gl_FragData[1]=vec4(blend, 1.0,0.0,0.0);
    }