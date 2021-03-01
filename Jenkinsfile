pipeline {
    agent {
        node {
            label 'jetson'
        }
    }
    environment {
        DOCKER_REPOSITORY = credentials('DOCKER_REPOSITORY')
    }
    stages {
        stage('Build') {
            steps {
                checkout scm
                echo 'Building in jetson..'
                sh 'ls -la'
                sh 'echo aa$DOCKER_REPOSITORY'
                sh 'uname -m'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}