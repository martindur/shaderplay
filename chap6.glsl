#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359


vec3 landCol = vec3(0.298, 0.302, 0.6471);
vec3 skyCol = vec3(0.3294, 0.6196, 0.8863);
vec3 horizonCol = vec3(0.9686, 0.2588, 0.0824);
vec3 bloomCol = vec3(0.9686, 0.5216, 0.3451);

void main(){

    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float pct = st.y;
    float y = (pct * 2.0) - 1.0;
    float floor_mask = step(1.0 - pct, 0.5);
    pct = 1.0 - pow(abs(sin(PI * y/ 2.0)), 0.1);
    float pct2 = 1.0 - pow(abs(sin(PI * y / 2.0)), 0.1);

    pct *= floor_mask;
    pct += pct2;
    vec3 horizon_mask = vec3(pct);

    vec3 color = mix(landCol, skyCol, floor_mask);
    color = mix(color, horizonCol, pct);
    color = mix(color, bloomCol, pct2);



    gl_FragColor = vec4(color, 1.0);
}