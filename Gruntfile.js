module.exports = function(grunt) {
    grunt.initConfig({
        coffee: {
            compile: {
                expand: true,
                cwd: './src/resources/coffee',
                src: ['**/*.coffee'],
                dest: './src/js',
                ext: '.js'
            }
        },
        less: {
            compile: {
                expand: true,
                cwd: './src/resources/less',
                src: ['**/*.less', '!vendor/bootstrap/*.less', '!vendor/bootstrap/fontawesome/*.less', '!vendor/bootstrap/mixins/*.less'],
                dest: './src/css',
                ext: '.css'
            }
        },
        watch: {
            stylesheets: {
                files: '**/*.less',
                tasks: ['less']
            },
            scripts: {
                files: '**/*.coffee',
                tasks: ['coffee']
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['less', 'coffee', 'watch']);
}