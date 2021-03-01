podTemplate(yaml """\
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
        """.stripIndent()) {
    node(POD_LABEL) {
        stage('Build') {
            container('maven') {
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