precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 color;

vec3 goochColor(vec3 cool, vec3 warm, float weight) {
  return (1.0 - weight) * cool + weight * warm;
}

float goochWeight(vec3 normal, vec3 lightDirection) {
  return 0.5 * (1.0 + dot(normal, lightDirection));
}

void main() {
  gl_Position = projection * view * model * vec4(position,1);

  //vec3 vNormal = ( vec4(normal, 1.) * inverseModel * inverseView ).xyz;
  vec3 vNormal = ( vec4(normal, 1.) * inverseModel ).xyz;

  float brightness = max(0., dot(vNormal, normalize(lightDirection)));

  color = goochColor( cool, warm, goochWeight(vNormal, lightDirection));
}
