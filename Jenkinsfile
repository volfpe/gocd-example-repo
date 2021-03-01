pipeline {
    agent {
        node {
            label 'jetson'
        }
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building in jetson..'
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