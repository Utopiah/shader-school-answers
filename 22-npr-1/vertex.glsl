precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 vColor;

void main() {
  gl_Position = projection * view * model * vec4(position,1);
  
  //vec3 viewNormal = normalize((vec4(normal, 0.0) * inverseModel * inverseView).xyz);
  // https://www.bountysource.com/issues/21435043-bug-in-22-npr-1-cel-shading
  vec3 viewNormal = normalize((vec4(normal, 0.0) * inverseModel ).xyz);

  vec3 ambient = vec3(0.0);
  float brightness = viewNormal.x*lightDirection.x + viewNormal.y*lightDirection.y + viewNormal.z*lightDirection.z;

  float celIntensity = ceil(brightness * numBands) / numBands;

  vColor = ambient + diffuse * max(celIntensity, 0.0);

}
