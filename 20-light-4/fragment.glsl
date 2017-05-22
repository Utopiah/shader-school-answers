precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightPosition; 
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;

varying vec3 lightDirection;

void main() {
  vec3 eyeDirection = normalize(vEyeDirection);
  vec3 normal = normalize(vNormal);

  vec3 right = reflect(normalize(lightDirection), normal);

  float eyeLight = max(dot(right, eyeDirection), 0.0);
  float phong = pow(eyeLight, shininess);

  float lambert = max(dot(normal, normalize(lightDirection)), 0.0);
  
  gl_FragColor = vec4(ambient + diffuse * lambert + specular * phong,1);
}
