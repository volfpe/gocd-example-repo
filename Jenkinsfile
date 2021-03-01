pipeline {
    agent {
        node {
            label 'jetson'
        }
    }
    stages {
        stage('Build') {
            steps {
                checkout scm
                echo 'Building in jetson..'
                sh 'ls-la'
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