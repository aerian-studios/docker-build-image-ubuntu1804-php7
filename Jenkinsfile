pipeline {
    agent { 
        label 'master'
    }
    environment {
        REPO_NAME = "docker-build-image-ubuntu1604-php74"
    }
    options {
        disableConcurrentBuilds()
        timeout(time: 60, unit: 'MINUTES')
    }
    stages {
        stage('Build Ubuntu 16.04') {
            steps {
                sh "./build.sh ${REPO_NAME}"
            }
            post {
                success {
                    sh "ls -lh"
                }
            }
        }
    }
}
