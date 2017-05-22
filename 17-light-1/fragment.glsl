precision mediump float;

uniform mat4 model, view, projection;
uniform vec3 ambient;

varying vec3 color;

void main() {
  gl_FragColor = vec4(color,1);
}
