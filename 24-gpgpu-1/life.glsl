precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float past(vec2 coord){
  return texture2D(prevState, fract(coord / stateSize)).r;
}

float state(vec2 coord) {
  float sum = 0.;
  sum += past( vec2(coord.x-1., coord.y) ); 
  sum += past( vec2(coord.x+1., coord.y) ); 
  sum += past( vec2(coord.x, coord.y-1.) ); 
  sum += past( vec2(coord.x, coord.y+1.) ); 
  sum += past( vec2(coord.x-1., coord.y-1.) ); 
  sum += past( vec2(coord.x+1., coord.y+1.) ); 
  sum += past( vec2(coord.x-1., coord.y+1.) ); 
  sum += past( vec2(coord.x+1., coord.y-1.) ); 

  if (past(coord) == 1.0){
    if (sum == 2.0) {
	return 1.;
    }
    if (sum == 3.0) {
	return 1.;
    }
  } else {
    if (sum == 3.0) {
        return 1.;
    }
  }
  return 0.;
}

void main() {
  vec2 coord = gl_FragCoord.xy;


  //TODO: Compute the next state for the cell at coord
  float s = state(coord);

  gl_FragColor = vec4(s,s,s, 1.0);
}
