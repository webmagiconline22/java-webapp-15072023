pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
                sh "mvn test"
                junit '**/target/surefire-reports/*.xml'
            }
        }
            
        stage('Build') {
            steps {
                sh "mvn clean install package"
            }
        }
    }
}
