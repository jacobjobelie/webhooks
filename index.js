var execFile = require('child_process').execFile;
var githubhook = require('githubhook');
var readDir = require('readdir');
var fs = require('fs');
var github = githubhook({
    host: '127.0.0.1',
    port: 1808,
    path: '/',
    secret: 'rad',
    logger: console,
});

var filesArray = readDir.readSync( 'sh', ['**.sh'], readDir.ABSOLUTE_PATHS  );
filesArray.forEach(p=>{
    fs.chmodSync(p, '0777')
})

github.listen();

function _exec(file){
    // Exec a shell script
    var execOptions = {
        maxBuffer: 1024 * 1024 // Increase max buffer to 1mb
    };
    console.log(`${file}.sh`);
    execFile(`./${file}.sh`, execOptions, function(error, stdout, stderr) {
        if( error )
        {
            console.log(error)
        }
    });
}

github.on('chewb-cron:refs/heads/master', function (data) {
    _exec('chewb-cron')
})

github.on('add.dog:refs/heads/master', function (data) {
    _exec('add.dog')
});