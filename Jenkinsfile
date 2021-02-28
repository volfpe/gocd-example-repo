podTemplate(containers: [
    containerTemplate(name: "kaniko", image:"gcr.io/kaniko-project/executor:debug",  ttyEnabled: true, command: "/busybox/cat")
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
