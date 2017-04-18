var fs = require('fs');
var path = require('path');

module.exports = function filterList (dirName, ext, callback) {
  if (callback === undefined) {
    callback = function(err, fileName) {
      if (err) console.error(err);
      else console.log(fileName);
    };
  }

  fs.readdir(dirName, function (err, list) {
    if (err) return callback(err);
    for (var fileName of list) {
      if (path.extname(fileName) === `.${ext}`) {
        callback(null, fileName);
      }
    }
  });
};
