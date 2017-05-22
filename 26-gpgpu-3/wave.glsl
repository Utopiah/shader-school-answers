precision mediump float;

uniform sampler2D prevState[2];
uniform vec2 stateSize;
uniform float kdamping;
uniform float kdiffuse;

float state0(vec2 x) {
  return texture2D(prevState[0], fract(x / stateSize)).r;
}
float state1(vec2 x) {
  return texture2D(prevState[1], fract(x / stateSize)).r;
}

float f(float x, float y, int t){
	if (t == 1){
		return state0(vec2(x, y));
	}
	return state1(vec2(x, y));
}

float laplace(float x, float y, int t) {
  return f(x-1.,y,t) + f(x+1.,y,t) + f(x,y-1.,t) + f(x,y+1.,t) - 4. * f(x,y,t);
}

void main() {
  int t = 1;
  vec2 coord = gl_FragCoord.xy;
  float x = coord.x;
  float y = coord.y;

  //TODO: Solve for next state using a 5-point Laplacian stencil and the explicit Euler rule

  float c = (1. - kdamping) * ( kdiffuse * laplace(x, y, t) + 2. * f(x,y,t)) - f(x,y,t-1);


  gl_FragColor = vec4(c,c,c,1);
}
