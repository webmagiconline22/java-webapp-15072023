pipeline {
    agent any

    stages {
// Junit testing the code
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }

// Building the java application 
        stage('Build App') {
            steps {
                sh "mvn clean install package"
            }
        }
// Build & Push Docker Image
        stage('Publish') {
            steps {
                // Using the credential parameter in the `withCredentials` block
                withCredentials([usernamePassword(credentialsId: "${params.DOCKERHUB_CREDENTIALS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker build -t ${DOCKER_USERNAME}/javaweb:16072023 ."
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${DOCKER_USERNAME}/javaweb:16072023"
                }
            }
        }
}
