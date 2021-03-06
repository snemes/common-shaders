// GLSL shader autogenerated by cg2glsl.py.
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
COMPAT_VARYING     vec2 _blur_dxdy;
COMPAT_VARYING     vec2 _tex_uv1;
COMPAT_VARYING     vec4 _position1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec4 _position1;
    vec2 _tex_uv1;
    vec2 _blur_dxdy;
};
out_vertex _ret_0;
input_dummy _IN1;
vec4 _r0006;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _dxdy_scale;
    _r0006 = VertexCoord.x*MVPMatrix[0];
    _r0006 = _r0006 + VertexCoord.y*MVPMatrix[1];
    _r0006 = _r0006 + VertexCoord.z*MVPMatrix[2];
    _r0006 = _r0006 + VertexCoord.w*MVPMatrix[3];
    _dxdy_scale = InputSize/OutputSize;
    _OUT._blur_dxdy = _dxdy_scale/TextureSize;
    _ret_0._position1 = _r0006;
    _ret_0._tex_uv1 = TexCoord.xy;
    _ret_0._blur_dxdy = _OUT._blur_dxdy;
    gl_Position = _r0006;
    TEX0.xy = TexCoord.xy;
    TEX1.xy = _OUT._blur_dxdy;
    return;
    TEX0.xy = _ret_0._tex_uv1;
    TEX1.xy = _ret_0._blur_dxdy;
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
COMPAT_VARYING     vec2 _blur_dxdy;
COMPAT_VARYING     vec2 _tex_uv1;
COMPAT_VARYING     float _frame_rotation;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
    float _frame_direction;
    float _frame_rotation;
};
struct out_vertex {
    vec2 _tex_uv1;
    vec2 _blur_dxdy;
};
vec4 _TMP4;
uniform sampler2D Texture;
vec3 _TMP9;
float _texel0to1ratio0012;
vec2 _sample0d_texel_offset0012;
vec2 _dxdy_mirror_x0012;
vec2 _dxdy_mirror_y0012;
vec2 _dxdy_mirror_xy0012;
vec3 _sample0a0012;
vec3 _sample0b0012;
vec3 _sample0c0012;
float _TMP13;
vec2 _tex_coords0018;
vec2 _tex_coords0024;
vec2 _tex_coords0030;
vec2 _tex_coords0036;
vec4 _color0042;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    _TMP13 = pow(2.71828198E+00, -1.27322698E+00);
    _texel0to1ratio0012 = _TMP13/(5.00000000E-01 + _TMP13);
    _sample0d_texel_offset0012 = vec2(_texel0to1ratio0012, _texel0to1ratio0012);
    _dxdy_mirror_x0012 = TEX1.xy*vec2( -1.00000000E+00, 1.00000000E+00);
    _dxdy_mirror_y0012 = TEX1.xy*vec2( 1.00000000E+00, -1.00000000E+00);
    _dxdy_mirror_xy0012 = -TEX1.xy;
    _tex_coords0018 = TEX0.xy + _dxdy_mirror_xy0012*_sample0d_texel_offset0012;
    _TMP4 = COMPAT_TEXTURE(Texture, _tex_coords0018);
    _sample0a0012 = _TMP4.xyz;
    _tex_coords0024 = TEX0.xy + _dxdy_mirror_y0012*_sample0d_texel_offset0012;
    _TMP4 = COMPAT_TEXTURE(Texture, _tex_coords0024);
    _sample0b0012 = _TMP4.xyz;
    _tex_coords0030 = TEX0.xy + _dxdy_mirror_x0012*_sample0d_texel_offset0012;
    _TMP4 = COMPAT_TEXTURE(Texture, _tex_coords0030);
    _sample0c0012 = _TMP4.xyz;
    _tex_coords0036 = TEX0.xy + TEX1.xy*_sample0d_texel_offset0012;
    _TMP4 = COMPAT_TEXTURE(Texture, _tex_coords0036);
    _TMP9 = 2.50000000E-01*(_sample0a0012 + _sample0b0012 + _sample0c0012 + _TMP4.xyz);
    _color0042 = vec4(_TMP9.x, _TMP9.y, _TMP9.z, 1.00000000E+00);
    FragColor = _color0042;
    return;
} 
#endif
