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

    github.on('chewb-cron:refs/heads/master', function(data) {
        _exec('chewb-cron')
    })

    github.on('add.dog:refs/heads/master', function(data) {
        _exec('add.dog')
    });

    github.on('samelie:refs/heads/master', function(data) {
        _exec('samelie')
    })

    github.on('rad.wtf:refs/heads/master', function(data) {
        _exec('rad.wtf')
    })

    github.on('mars.wtf:refs/heads/master', function(data) {
        _exec('mars.wtf')
    })

    github.on('thealhambra:refs/heads/master', function(data) {
        _exec('thealhambra')
    })
}
