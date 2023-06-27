/***************************************************
// Circle.js
// 3.3 NodeJS. Gestión de módulos
// transparencia 29 del tema 2. 
***************************************************/

exports.area = function(r) {
  return Math.PI * r * r
}

exports.circumference = function(r) {
  return 2 * Math.PI * r
}