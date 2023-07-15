pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh "mvn clean install package"
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'my-java-webapp/target/*.war', fingerprint: true
            }
        }
    }
}
