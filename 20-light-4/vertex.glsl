precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightPosition; 
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;
varying vec3 lightDirection; 

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;
  vec4 viewLight = view * vec4(lightPosition, 1.);

  vNormal = (vec4(normal, 0.0) * inverseModel * inverseView).xyz;

  vEyeDirection = normalize(viewPosition.xyz);
  lightDirection = viewLight.xyz - viewPosition.xyz;
}
