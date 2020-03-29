#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359

void main(){

    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float pct = st.y;
    vec3 horizon_mask = vec3(pct);



    gl_FragColor = vec4(horizon_mask, 1.0);
}