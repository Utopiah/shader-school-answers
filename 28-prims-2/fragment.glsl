precision highp float;

uniform vec3 frontColor, backColor;

void main() {
  gl_FragColor = vec4(backColor,1);
  if (gl_FrontFacing){
	  gl_FragColor = vec4(frontColor,1);
  }
}
