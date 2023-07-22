pipeline {
    agent any

    stages {
        stage('Build & Publish') {
            steps {
                // Using the global credentials directly in the `withCredentials` block
                withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker build -t ${DOCKER_USERNAME}/javaweb:latest ."
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push ${DOCKER_USERNAME}/javaweb:latest"
                }
            }
        }
    }
}
