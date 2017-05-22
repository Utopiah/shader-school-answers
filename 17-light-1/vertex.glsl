precision mediump float;

attribute vec3 position;
uniform mat4 model, view, projection;
uniform vec3 ambient;

varying vec3 color;

void main() {
  gl_Position = projection * view * model * vec4(position, 1);
  color = mix( mix(vec3(.3,.6,.6), vec3(.8,.6,.4), cos(position.x*position.y)), vec3(0.), 1.0-position.z);
}
