var execFile = require('child_process').execFile;
var githubhook = require('githubhook');
var readDir = require('readdir');
var fs = require('fs');
var routes = require('./routes');
var github = githubhook({
    host: '127.0.0.1',
    port: 1808,
    path: '/',
    secret: 'rad',
    logger: console,
});

var filesArray = readDir.readSync('sh', ['**.sh'], readDir.ABSOLUTE_PATHS);
filesArray.forEach(p => {
    fs.chmodSync(p, '0777')
})

github.listen();

function _exec(file) {
    var execOptions = {
        maxBuffer: 1024 * 1024 // Increase max buffer to 1mb
    };
    console.log(`${file}.sh`);
    execFile(`./${file}.sh`, execOptions, function(error, stdout, stderr) {
        if (error) {
            console.log(error)
        }
    });
}

github.on('webhooks:refs/heads/master', function(data) {
    _exec('webhooks')
})

const Routes = routes(github)
