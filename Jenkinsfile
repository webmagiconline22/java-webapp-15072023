pipeline {
    agent any

    stages {

        stage('Test') {
            steps {
                sh "mvn test"
            }
        }

        // stage('Static Code Analysis') {
        //     steps {
        //         sh "mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=webmagiconline1_java-webapp-15072023"
        //     }
        // }
            
        stage('Build') {
            steps {
                sh "mvn clean install package"
            }
        }
    }
}
