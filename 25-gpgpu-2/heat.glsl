precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

float laplace(float x, float y) {
  return (
    state(vec2(x-1.,y)) +
    state(vec2(x+1.,y)) +
    state(vec2(x,y-1.)) +
    state(vec2(x,y+1.))
  ) - 4.0 * state(vec2(x,y));
}


void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float x = coord.x;
  float y = coord.y;
  y = (1.0 - kdamping) * ( kdiffuse * laplace(x,y) + state(vec2(x,y)) );


  gl_FragColor = vec4(y,y,y,1);
}
