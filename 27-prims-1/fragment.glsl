precision highp float;

varying vec3 vColor;

void main() {
  float x = gl_PointCoord.x;
  float y = gl_PointCoord.y;
  float cx = 0.5;
  float cy = 0.5;
  float r = 0.5;
  gl_FragColor = vec4(vColor, 1);
  if ( (x-cx)*(x-cx) + (y-cy)*(y-cy) > r*r ){
	discard;
  }
}
