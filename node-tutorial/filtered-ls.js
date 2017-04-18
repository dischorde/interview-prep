var filterModule = require('./make-it-modular.js');

filterModule(process.argv[2], process.argv[3], function(err, fileName) {
  if (err) console.error(err);
  else console.log(fileName);
});
