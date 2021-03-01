pipeline {
    agent none
    environment {
        DOCKER_REPOSITORY = credentials('DOCKER_REPOSITORY')
    }
    stages {
        stage('Build') {
            agent {
                node {
                    label 'jetson'
                }
            }
            steps {
                checkout scm
                echo 'Building in jetson..'
                sh 'ls -la'
                sh 'echo aa$DOCKER_REPOSITORY'
                sh 'uname -m'
            }
        }
  
    }
}