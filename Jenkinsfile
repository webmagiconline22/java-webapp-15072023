pipeline {
    agent any

    environment {
        // Set the PATH variable to include the location of Maven executable
        PATH = "/opt/maven/bin:${env.PATH}"
    }
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
        stage('Deploy to ACI') {
            steps {
                sh 'az login --service-principal -u <service_principal_id> -p "<service_principal_secret>" --tenant <azure_tenant_id>'
                sh 'az container create --resource-group ${RG_NON_PROD} --file aci.yaml'
            }
        }
  }
}
