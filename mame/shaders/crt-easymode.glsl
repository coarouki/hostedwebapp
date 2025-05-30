#if defined(VERTEX)

    #if __VERSION__ >= 130
    #define COMPAT_VARYING out
    #define COMPAT_ATTRIBUTE in
    #define COMPAT_TEXTURE texture
    #else
    #define COMPAT_VARYING varying
    #define COMPAT_ATTRIBUTE attribute
    #define COMPAT_TEXTURE texture2D
    #endif
    
    #ifdef GL_ES
    #define COMPAT_PRECISION mediump
    #else
    #define COMPAT_PRECISION
    #endif
    COMPAT_VARYING     float _frame_rotation;
    struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
    };
    vec4 _oPosition1;
    vec4 _r0005;
    COMPAT_ATTRIBUTE vec4 VertexCoord;
    COMPAT_ATTRIBUTE vec4 TexCoord;
    COMPAT_VARYING vec4 TEX0;
    
    uniform mat4 MVPMatrix;
    uniform int FrameDirection;
    uniform int FrameCount;
    uniform COMPAT_PRECISION vec2 OutputSize;
    uniform COMPAT_PRECISION vec2 TextureSize;
    uniform COMPAT_PRECISION vec2 InputSize;
    void main()
    {
    vec2 _oTex;
    _r0005 = VertexCoord.x*MVPMatrix[0];
    _r0005 = _r0005 + VertexCoord.y*MVPMatrix[1];
    _r0005 = _r0005 + VertexCoord.z*MVPMatrix[2];
    _r0005 = _r0005 + VertexCoord.w*MVPMatrix[3];
    _oPosition1 = _r0005;
    _oTex = TexCoord.xy;
    gl_Position = _r0005;
    TEX0.xy = TexCoord.xy;
    }
    #elif defined(FRAGMENT)
    
    #if __VERSION__ >= 130
    #define COMPAT_VARYING in
    #define COMPAT_TEXTURE texture
    out vec4 FragColor;
    #else
    #define COMPAT_VARYING varying
    #define FragColor gl_FragColor
    #define COMPAT_TEXTURE texture2D
    #endif
    
    #ifdef GL_ES
    #ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
    #else
    precision mediump float;
    #endif
    #define COMPAT_PRECISION mediump
    #else
    #define COMPAT_PRECISION
    #endif
    COMPAT_VARYING     float _frame_rotation;
    struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
    };
    vec4 _ret_0;
    float _TMP30;
    float _TMP29;
    float _TMP28;
    float _TMP13;
    float _TMP32;
    float _TMP11;
    float _TMP10;
    float _TMP31;
    float _TMP9;
    float _TMP8;
    float _TMP15;
    float _TMP14;
    float _TMP33;
    vec4 _TMP34;
    vec4 _TMP27;
    vec4 _TMP25;
    vec4 _TMP23;
    vec4 _TMP21;
    vec4 _TMP26;
    vec4 _TMP24;
    vec4 _TMP22;
    vec4 _TMP20;
    float _TMP4;
    vec4 _TMP3;
    vec4 _TMP2;
    float _TMP19;
    float _TMP18;
    float _TMP17;
    float _TMP16;
    vec4 _TMP1;
    vec2 _TMP0;
    uniform sampler2D Texture;
    input_dummy _IN1;
    float _TMP43;
    float _x_step0044;
    float _curve0044;
    float _a0048;
    float _val0052;
    float _a0052;
    vec4 _TMP57;
    vec4 _x0072;
    vec2 _c0086;
    vec4 _x0088;
    vec4 _x0094;
    vec2 _c0098;
    vec4 _x0100;
    vec2 _c0104;
    vec4 _x0106;
    vec4 _sample_min0110;
    vec4 _sample_max0110;
    vec4 _r0112;
    vec4 _TMP117;
    vec2 _co0124;
    vec2 _c0126;
    vec4 _x0128;
    vec4 _x0134;
    vec2 _c0138;
    vec4 _x0140;
    vec2 _c0144;
    vec4 _x0146;
    vec4 _sample_min0150;
    vec4 _sample_max0150;
    vec4 _r0152;
    vec4 _TMP157;
    float _TMP163;
    float _x_step0164;
    float _curve0164;
    float _a0168;
    float _val0172;
    float _a0172;
    float _TMP183;
    float _TMP189;
    float _x0190;
    float _a0196;
    float _x0198;
    vec2 _x0200;
    float _x0208;
    COMPAT_VARYING vec4 TEX0;
    
    uniform COMPAT_PRECISION vec2 OutputSize;
    uniform COMPAT_PRECISION vec2 TextureSize;
    uniform COMPAT_PRECISION vec2 InputSize;
    void main()
    {
    vec2 _dx1;
    vec2 _dy;
    vec2 _pix_co;
    vec2 _tex_co;
    vec2 _dist;
    vec3 _col2;
    vec3 _col21;
    vec4 _coeffs1;
    float _luma;
    float _bright;
    float _scan_weight;
    vec2 _mod_fac;
    int _dot_no;
    vec3 _mask_weight;
    vec3 _TMP37;
    _dx1 = vec2(1.00000000E+00/TextureSize.x, 0.00000000E+00);
    _dy = vec2(0.00000000E+00, 1.00000000E+00/TextureSize.y);
    _pix_co = TEX0.xy*TextureSize - vec2( 5.00000000E-01, 5.00000000E-01);
    _TMP0 = floor(_pix_co);
    _tex_co = (_TMP0 + vec2( 5.00000000E-01, 5.00000000E-01))/TextureSize;
    _dist = fract(_pix_co);
    _x_step0044 = float((_dist.x >= 5.00000000E-01));
    _a0048 = 2.50000000E-01 - (_dist.x - _x_step0044)*(_dist.x - _x_step0044);
    _TMP33 = inversesqrt(_a0048);
    _TMP14 = 1.00000000E+00/_TMP33;
    _a0052 = 5.00000000E-01 - _dist.x;
    _val0052 = float((_a0052 > 0.00000000E+00));
    _TMP15 = _val0052 - float((_a0052 < 0.00000000E+00));
    _curve0044 = 5.00000000E-01 - _TMP14*_TMP15;
    _TMP43 = _dist.x + 2.50000000E-01*(_curve0044 - _dist.x);
    _coeffs1 = 3.14159274E+00*vec4(1.00000000E+00 + _TMP43, _TMP43, 1.00000000E+00 - _TMP43, 2.00000000E+00 - _TMP43);
    _TMP1 = abs(_coeffs1);
    _TMP57 = max(_TMP1, vec4( 9.99999975E-06, 9.99999975E-06, 9.99999975E-06, 9.99999975E-06));
    _TMP16 = sin(_TMP57.x);
    _TMP17 = sin(_TMP57.y);
    _TMP18 = sin(_TMP57.z);
    _TMP19 = sin(_TMP57.w);
    _TMP2 = vec4(_TMP16, _TMP17, _TMP18, _TMP19);
    _x0072 = _TMP57/2.00000000E+00;
    _TMP16 = sin(_x0072.x);
    _TMP17 = sin(_x0072.y);
    _TMP18 = sin(_x0072.z);
    _TMP19 = sin(_x0072.w);
    _TMP3 = vec4(_TMP16, _TMP17, _TMP18, _TMP19);
    _coeffs1 = ((2.00000000E+00*_TMP2)*_TMP3)/(_TMP57*_TMP57);
    _TMP4 = dot(_coeffs1, vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _coeffs1 = _coeffs1/_TMP4;
    _c0086 = _tex_co - _dx1;
    _TMP20 = COMPAT_TEXTURE(Texture, _c0086);
    _x0088 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP20 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP21 = _TMP20*_x0088;
    _TMP22 = COMPAT_TEXTURE(Texture, _tex_co);
    _x0094 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP22 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP23 = _TMP22*_x0094;
    _c0098 = _tex_co + _dx1;
    _TMP24 = COMPAT_TEXTURE(Texture, _c0098);
    _x0100 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP24 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP25 = _TMP24*_x0100;
    _c0104 = _tex_co + 2.00000000E+00*_dx1;
    _TMP26 = COMPAT_TEXTURE(Texture, _c0104);
    _x0106 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP26 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP27 = _TMP26*_x0106;
    _r0112 = _coeffs1.x*_TMP21;
    _r0112 = _r0112 + _coeffs1.y*_TMP23;
    _r0112 = _r0112 + _coeffs1.z*_TMP25;
    _r0112 = _r0112 + _coeffs1.w*_TMP27;
    _sample_min0110 = min(_TMP23, _TMP25);
    _sample_max0110 = max(_TMP23, _TMP25);
    _TMP34 = min(_sample_max0110, _r0112);
    _TMP117 = max(_sample_min0110, _TMP34);
    _co0124 = _tex_co + _dy;
    _c0126 = _co0124 - _dx1;
    _TMP20 = COMPAT_TEXTURE(Texture, _c0126);
    _x0128 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP20 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP21 = _TMP20*_x0128;
    _TMP22 = COMPAT_TEXTURE(Texture, _co0124);
    _x0134 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP22 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP23 = _TMP22*_x0134;
    _c0138 = _co0124 + _dx1;
    _TMP24 = COMPAT_TEXTURE(Texture, _c0138);
    _x0140 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP24 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP25 = _TMP24*_x0140;
    _c0144 = _co0124 + 2.00000000E+00*_dx1;
    _TMP26 = COMPAT_TEXTURE(Texture, _c0144);
    _x0146 = vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00) + (_TMP26 - vec4( 1.00000000E+00, 1.00000000E+00, 1.00000000E+00, 1.00000000E+00));
    _TMP27 = _TMP26*_x0146;
    _r0152 = _coeffs1.x*_TMP21;
    _r0152 = _r0152 + _coeffs1.y*_TMP23;
    _r0152 = _r0152 + _coeffs1.z*_TMP25;
    _r0152 = _r0152 + _coeffs1.w*_TMP27;
    _sample_min0150 = min(_TMP23, _TMP25);
    _sample_max0150 = max(_TMP23, _TMP25);
    _TMP34 = min(_sample_max0150, _r0152);
    _TMP157 = max(_sample_min0150, _TMP34);
    _x_step0164 = float((_dist.y >= 5.00000000E-01));
    _a0168 = 2.50000000E-01 - (_dist.y - _x_step0164)*(_dist.y - _x_step0164);
    _TMP33 = inversesqrt(_a0168);
    _TMP14 = 1.00000000E+00/_TMP33;
    _a0172 = 5.00000000E-01 - _dist.y;
    _val0172 = float((_a0172 > 0.00000000E+00));
    _TMP15 = _val0172 - float((_a0172 < 0.00000000E+00));
    _curve0164 = 5.00000000E-01 - _TMP14*_TMP15;
    _TMP163 = _dist.y + (_curve0164 - _dist.y);
    _col2 = _TMP117.xyz + _TMP163*(_TMP157.xyz - _TMP117.xyz);
    _luma = dot(vec3( 2.12599993E-01, 7.15200007E-01, 7.22000003E-02), _col2);
    _TMP8 = max(_col2.y, _col2.z);
    _TMP9 = max(_col2.x, _TMP8);
    _bright = (_TMP9 + _luma)/2.00000000E+00;
    _TMP31 = min(6.49999976E-01, _bright);
    _TMP183 = max(3.49999994E-01, _TMP31);
    _x0190 = _bright*1.50000000E+00;
    _TMP31 = min(1.50000000E+00, _x0190);
    _TMP189 = max(1.50000000E+00, _TMP31);
    _a0196 = TEX0.y*2.00000000E+00*3.14159274E+00*TextureSize.y;
    _TMP10 = cos(_a0196);
    _x0198 = _TMP10*5.00000000E-01 + 5.00000000E-01;
    _TMP11 = pow(_x0198, _TMP189);
    _scan_weight = 1.00000000E+00 - _TMP11;
    _x0200 = (TEX0.xy*OutputSize*TextureSize)/InputSize;
    _mod_fac = floor(_x0200);
    _x0208 = _mod_fac.x/3.00000000E+00;
    _TMP32 = floor(_x0208);
    _TMP13 = _mod_fac.x - 3.00000000E+00*_TMP32;
    _dot_no = int(_TMP13);
    if (_dot_no == 0) {
    _mask_weight = vec3( 1.00000000E+00, 6.99999988E-01, 6.99999988E-01);
    } else {
    if (_dot_no == 1) {
    _mask_weight = vec3( 6.99999988E-01, 1.00000000E+00, 6.99999988E-01);
    } else {
    _mask_weight = vec3( 6.99999988E-01, 6.99999988E-01, 1.00000000E+00);
    }
    }
    if (InputSize.y >= 4.00000000E+02) {
    _scan_weight = 1.00000000E+00;
    }
    _col21 = _col2.xyz;
    _col2 = _col2*vec3(_scan_weight, _scan_weight, _scan_weight);
    _col2 = _col2 + _TMP183*(_col21 - _col2);
    _col2 = _col2*_mask_weight;
    _TMP28 = pow(_col2.x, 5.55555582E-01);
    _TMP29 = pow(_col2.y, 5.55555582E-01);
    _TMP30 = pow(_col2.z, 5.55555582E-01);
    _col2 = vec3(_TMP28, _TMP29, _TMP30);
    _TMP37 = _col2*1.20000005E+00;
    _ret_0 = vec4(_TMP37.x, _TMP37.y, _TMP37.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
    }
    #endif
