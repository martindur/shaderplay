#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

#define PI 3.14159265359

float plot(vec2 uv, float pct){
    return smoothstep(pct-0.02, pct, uv.y) -
        smoothstep(pct, pct+0.02, uv.y);
}

vec3 colA = vec3(0.8588, 0.6235, 0.1176);
vec3 colB = vec3(0.5647, 0.2314, 0.9451);
vec3 colC = vec3(0.0, 1.0, 0.051);

void main(){
    vec2 uv = gl_FragCoord.xy/u_resolution.xy;
    float sin_motion = sin(u_time);
    float x = (uv.x * 2.0) - 1.0;

    float y = pow(x, 2.);
    y = abs(pow(abs(x), 2.));
    y = pow(cos(PI * x / 2.0), 0.5);
    y = 1.0 - pow(abs(sin(PI * x / 2.0)), 0.2);
    float y2 = pow(min(cos(PI * x / 2.0), 1.0 - abs(x)), 0.5);
//    y = 1.0 - pow(max(0.0, abs(x) * 10.0 - 1.0), 0.4);


//    y = (y+1.0) / 2.0;
    vec3 color = vec3(y);

//    float pct = plot(uv, y);
   // pct += plot(uv, y);
//    color = (1.0-pct)*color+pct*vec3(0.0, 1.0, 0.0);

    float pct = abs(sin(u_time) * y);
    float pct2 = abs(sin(u_time * 3.) * y2);
    color = mix(colA, colB, pct);
    color = mix(color, colC, pct2);


    gl_FragColor = vec4(color, 1.0);
}