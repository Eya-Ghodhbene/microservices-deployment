pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/votre-repo/microservices'
            }
        }
        stage('Build Docker Images') {
            steps {
                sh 'docker build -t payment-service:latest -f Dockerfile .'
                sh 'docker build -t driver-service:latest ./driver-service'
                sh 'docker build -t rider-service:latest ./rider-service'
                sh 'docker build -t ride-service:latest ./ride-service'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u <docker-username> -p <docker-password>'
                sh 'docker push payment-service:latest'
                sh 'docker push driver-service:latest'
                sh 'docker push rider-service:latest'
                sh 'docker push ride-service:latest'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f mongo-deployment.yaml'
                sh 'kubectl apply -f payment-deployment.yaml'
                sh 'kubectl apply -f driver-deployment.yaml'
                sh 'kubectl apply -f rider-deployment.yaml'
                sh 'kubectl apply -f ride-deployment.yaml'
            }
        }
    }
}