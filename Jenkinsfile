podTemplate(yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor@sha256:4f42b973357063ef8cd1cd87922f586dcb1323f4ea153100987915b2e73af4f5
    command:
    - /busybox/cat
  tolerations:
  - key: "arch"
    operator: "Equal"
    value: "arm64"
    effect: "NoSchedule"
  nodeSelector:
    arch: arm64
"""
) {
    node(POD_LABEL) {
        stage('Build') {
            container('kaniko') {
                stage('Build in kaniko') {
                    checkout scm
                    sh 'echo pod build'
                    sh 'ls -la'
                    sh './jenkins/build.sh'
                }
            }
        }
        stage('Test') {
            sh 'echo pod test'
        }
        stage('Deploy') {
            sh 'echo pod deploy'
        }
    }
}
