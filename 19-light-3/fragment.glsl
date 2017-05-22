precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;

void main() {
  vec3 eyeDirection = normalize(vEyeDirection);
  vec3 normal = normalize(vNormal);

  vec3 right = reflect(lightDirection, normal);

  float eyeLight = max(dot(right, eyeDirection), 0.0);
  float phong = pow(eyeLight, shininess);

  float lambert = dot(normal, lightDirection);
  
  gl_FragColor = vec4(ambient + diffuse * lambert + specular * phong,1);
}
