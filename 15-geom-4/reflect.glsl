vec3 reflectPoint(vec3 p, vec3 n) {
  return p - 2.0 * dot(n, p) * n / dot(n, n);
}

highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n

  n = normalize(n);
  return mat4(1.-2.*n.x*n.x, -2.*n.x*n.y, -2.*n.x*n.z, 0,
              -2.*n.x*n.y, 1.-2.*n.y*n.y, -2.*n.y*n.z, 0, 
              -2.*n.x*n.z, -2.*n.y*n.z, 1.-2.*n.z*n.z, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(reflection)
