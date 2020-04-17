pipeline {
    agent { 
        label 'master'
    }
    environment {
        REPO_NAME = "docker-build-image-ubuntu1804-php7"
    }
    options {
        disableConcurrentBuilds()
        timeout(time: 60, unit: 'MINUTES')
    }
    stages {
        stage('Build Ubuntu 18.04') {
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
