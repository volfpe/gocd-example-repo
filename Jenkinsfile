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
                    metadata:
                    labels:
                        some-label: some-label-value
                    spec:
                    containers:
                    - name: maven
                      image: maven:alpine
                      command:
                      - cat
                      tty: true
                    - name: busybox
                      image: busybox
                      command:
                      - cat
                      tty: true
                    """.stripIndent()
                }
            }
            
            steps {
                container('maven') {

                    checkout scm
                    sh 'echo pod build'
                    sh 'ls -la'
                    
                }
            }
        }
    }
}