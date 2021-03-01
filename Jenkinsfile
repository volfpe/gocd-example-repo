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
        stage('Test') {
            agent {
                kubernetes {
                    yaml """\
                        apiVersion: v1
                        kind: Pod
                        spec:
                        containers:
                        - name: kaniko
                            image: gcr.io/kaniko-project/executor:debug
                            command:
                            - /busybox/cat
                        """.stripIndent()
                }
            }
            steps {
                container('kaniko') {

                    checkout scm
                    sh 'echo pod build'
                    sh 'ls -la'
                    
                }
            }
        }
    }
}