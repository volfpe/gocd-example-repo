pipeline {
    agent {
        kubernetes {
        yaml """\
            apiVersion: v1
            kind: Pod
            metadata:
            spec:
              containers:
              - name: python
                image: python:3.8-buster
                command:
                - cat
                tty: true
              - name: kaniko
                image: gcr.io/kaniko-project/executor:debug
                command:
                - cat
                tty: true
              - name: helm-kubectl
                image: dtzar/helm-kubectl:3.4.2
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

        MLFLOW_TRACKING_USERNAME = credentials('MLFLOW_TRACKING_USERNAME')
        MLFLOW_TRACKING_PASSWORD = credentials('MLFLOW_TRACKING_PASSWORD')
        MLFLOW_S3_ENDPOINT_URL = credentials('MLFLOW_S3_ENDPOINT_URL')
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Get Model Version') {
            steps {
                container('python') {
                    checkout scm
                    sh './jenkins/model-version.sh'
                    stash(name: "model_version", includes: 'model_version.txt')
                }

            }
        }
        stage('Build') {
            agent {
                node {
                    label 'jetson'
                }
            }
            steps {
                checkout scm
                unstash("model_version")
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
        stage('Deploy') {
            steps {
                container('helm-kubectl') {
                    withCredentials([file(credentialsId: 'JETSON_KUBE_CONFIG', variable: 'config')]) {
                        checkout scm
                        sh 'mkdir /root/.kube'
                        sh "cp \$config /root/.kube/"
                        sh './jenkins/deploy.sh'
                    }
                }

            }
        }
    }
}