podTemplate(yaml: """\
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: kaniko
            image: gcr.io/kaniko-project/executor:debug
            command:
            - cat
            tty: true
        """.stripIndent()) {
    node(POD_LABEL) {
        stage('Build') {
            container('kaniko') {
                stage('Build in kaniko') {
                    checkout scm
                    sh 'echo pod build'
                    sh 'ls -la'
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