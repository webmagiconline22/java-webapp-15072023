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
// Build Docker Image
        stage('Build Image') {
            steps {
                sh "docker build -t ${DOCKER_USERNAME}"/javaweb:16072023
            }
        }
// Push Docker Image
        stage('Build Image') {
            steps {
                sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                sh "docker push ${DOCKER_USERNAME}/javaweb:16072023"
            }
        }
}
