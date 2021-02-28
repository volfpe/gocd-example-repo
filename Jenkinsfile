podTemplate(yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor@sha256:dc7af2416f4c4a8f7dfab7e2ee564a058a9b08d3308fe14c26f117bf2b006f49
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
