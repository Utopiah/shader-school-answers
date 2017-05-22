precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient;

uniform PointLight lights[4];

varying vec3 vEyeDirection;
varying vec3 vNormal;

varying vec3 lightDirection[4];

void main() {
  vec3 eyeDirection = normalize(vEyeDirection);
  vec3 normal = normalize(vNormal);
  vec3 lightColor = ambient;

  for(int i=0; i<4; i++;){
    vec3 right = reflect(normalize(lightDirection[i]), normal);
    float eyeLight = max(dot(right, eyeDirection), 0.0);
    float phong = pow(eyeLight, lights[i].shininess);
    float lambert = max(dot(normal, normalize(lightDirection[i])), 0.0);
    lightColor += lambert * lights[i].diffuse + phong * lights[i].specular;
  }
  
  gl_FragColor = vec4(lightColor, 1);
}
