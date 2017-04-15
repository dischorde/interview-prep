var fs = require('fs');
var path = require('path');

fs.readdir(process.argv[2], function (err, list) {
  if (err) return console.error(err);
  for (var fileName of list) {
    if (path.extname(fileName) === `.${process.argv[3]}`) {
      console.log(fileName);
    }
  }
});
