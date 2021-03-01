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
        BUILD_DOCKER_HOST = credentials('DOCKER_HOST')
        BUILD_DOCKER_USER = credentials('DOCKER_USER')
        BUILD_DOCKER_PASS = credentials('DOCKER_PASS')
        BUILD_DOCKER_PROJECT = credentials('DOCKER_PROJECT')
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
                sh 'uname -m'
                sh 'pwd'
                sh './jenkins/build.sh'
            }
        }
        stage('Test') {
            steps {
                container('kaniko') {
                    checkout scm
                    sh 'echo testing...'
                }

            }
        }
    }
}