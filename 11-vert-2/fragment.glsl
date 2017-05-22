precision highp float;

varying vec3 mycolor;

void main() {
  gl_FragColor = vec4(mycolor,1);
}
