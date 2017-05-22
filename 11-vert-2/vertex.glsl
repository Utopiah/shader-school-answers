precision highp float;

attribute vec4 position;
attribute vec3 color;
varying vec3 mycolor;

void main() {
  gl_Position = position;
  mycolor = vec3(1.0, 0.0, 0.0);
  if (position.x < -0.4){
    mycolor = vec3(0.0, 1.0, 0.0);
  } else if (position.x > 0.4){
    mycolor = vec3(0.0, 0.0, 1.0);
  }
  //mycolor = vec3(position.y, 0.5+position.x-position.y, 0.5+position.x-position.y);
  //      0,1
  // -0.5,0      0.5,0
}
