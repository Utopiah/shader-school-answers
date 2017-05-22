precision highp float;

uniform float theta;

attribute vec2 position;

void main() {
  //TODO: rotate position by theta radians about the origin

  //gl_Position = vec4(position, 0, 1.0);
  gl_Position = vec4(cos(theta)*position.x - sin(theta)*position.y, sin(theta)*position.x + cos(theta)*position.y, 0, 1.0);
}
