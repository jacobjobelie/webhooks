var execFile = require('child_process').execFile;
var readDir = require('readdir');
var path = require('path');
module.exports = function(github) {

    function _exec(file) {
        var execOptions = {
            maxBuffer: 1024 * 1024 // Increase max buffer to 1mb
        };
        console.log(`${file}.sh`);
        execFile(`./sh/${file}.sh`, execOptions, function(error, stdout, stderr) {
            if (error) {
                console.log(error)
            }
        });
    }

    var files = readDir.readSync('sh', ["**.sh"], readDir.ABSOLUTE_PATHS)

    files.forEach(p => {
        const name = path.parse(p).name
        console.log(name);
        github.on(`${name}:refs/heads/master`, function(data) {
            _exec(name)
        })
    })
}
