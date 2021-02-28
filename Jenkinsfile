podTemplate {
    node(POD_LABEL) {
        stage('Build') {
            checkout scm
            sh 'echo pod build'
            sh 'ls -la'
        }
        stage('Test') {
            sh 'echo pod test'
        }
        stage('Deploy') {
            sh 'echo pod deploy'
        }
    }
}
