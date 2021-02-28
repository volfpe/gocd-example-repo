podTemplate(containers: [
    containerTemplate(name: "kaniko", image:"gcr.io/kaniko-project/executor@sha256:4f42b973357063ef8cd1cd87922f586dcb1323f4ea153100987915b2e73af4f5",  ttyEnabled: true, command: "/busybox/cat", tolerations: [Toleration(key: "arch", operator: "Equal", value: "arm64", effect: "NoSchedule")])
]) {
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
