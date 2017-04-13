var fs = require('fs');

var buff = fs.readFileSync(process.argv[2]);
var numLines =buff.toString().split('\n');
console.log(numLines.length - 1);
