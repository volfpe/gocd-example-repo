pipeline {
    agent {
        kubernetes {
        yaml """\
            apiVersion: v1
            kind: Pod
            metadata:
            spec:
              containers:
              - name: kaniko
                image: gcr.io/kaniko-project/executor:debug
                command:
                - cat
                tty: true
            """.stripIndent()
        }
    }
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
                sh 'pwd'
            }
        }
        stage('Test') {
            steps {
                container('kaniko') {
                    checkout scm
                    sh 'echo pod build'
                    sh 'ls -la'
                    sh 'uname -m'
                    sh 'pwd'
                }

            }
        }
    }
}