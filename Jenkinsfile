pipeline {
    agent any

    parameters {
        // Add parameters for Docker Hub credentials
        string(name: 'DOCKERHUB_CREDENTIALS', defaultValue: '', description: 'Docker Hub credentials ID')
    }
    
    stages {
// Build & Push Docker Image
        stage('Build & Publish') {
            steps {
                // Using the credential parameter in the `withCredentials` block
                withCredentials([usernamePassword(credentialsId: "${params.DOCKERHUB_CREDENTIALS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker build -t ${DOCKER_USERNAME}/javaweb:latest ."
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${DOCKER_USERNAME}/javaweb:latest"
                }
            }
        }
  }
}
