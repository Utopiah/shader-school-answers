precision mediump float;

bool inTile(vec2 p, float tileSize) {
  vec2 ptile = step(0.5, fract(0.5 * p / tileSize));
  return ptile.x == ptile.y;
}

void main() {

  //TODO: Replace this with a function that draws a checkerboard
  
  if ( inTile(gl_FragCoord.xy, 16.0) ) {
	gl_FragColor = vec4(1.0);
  } else {
	discard;
  }
}
