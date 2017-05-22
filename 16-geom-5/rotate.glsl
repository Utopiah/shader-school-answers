vec3 rotatePoint(vec3 p, vec3 n, float theta) {
  return (
    p * cos(theta) + cross(n, p) *
    sin(theta) + n * dot(p, n) *
    (1.0 - cos(theta))
  );
}

highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians

  n = -normalize(n);
  return mat4(cos(theta)+n.x*n.x*(1.-cos(theta)), n.x*n.y*(1.-cos(theta))-n.z*sin(theta), n.x*n.z*(1.-cos(theta))+n.y*sin(theta), 0,
              n.y*n.x*(1.-cos(theta))+n.z*sin(theta), cos(theta)+n.y*n.y*(1.-cos(theta)), n.y*n.z*(1.-cos(theta))-n.x*sin(theta), 0, 
              n.z*n.x*(1.-cos(theta))-n.y*sin(theta), n.z*n.y*(1.-cos(theta))+n.x*sin(theta), cos(theta)+n.z*n.z*(1.-cos(theta)), 0,
              0, 0, 0, 1);
}

#pragma glslify: export(rotation)
