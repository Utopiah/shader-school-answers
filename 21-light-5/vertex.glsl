precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;

uniform PointLight lights[4];

varying vec3 vEyeDirection;
varying vec3 vNormal;
varying vec3 lightDirection[4]; 

void main() {

  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;
  vNormal = (vec4(normal, 0.0) * inverseModel * inverseView).xyz;
  vEyeDirection = normalize(viewPosition.xyz);
  for (int i = 0; i<4; i++;){
	  vec4 viewLight = view * vec4(lights[i].position, 1.);
	  lightDirection[i] = viewLight.xyz - viewPosition.xyz;
  }
}
