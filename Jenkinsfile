pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'islem0512' // Remplacez par votre nom d'utilisateur Docker Hub
        DOCKER_HUB_PASSWORD = 'Miredodo:*1' // Remplacez par votre mot de passe Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository from GitHub...'
                git 'https://github.com/Eya-Ghodhbene/microservices-deployment'
            }
        }

        stage('Build Docker Images') {
            steps {
                echo 'Building Docker images for all services...'
                sh 'docker build -t payment-service:latest -f Dockerfile .'
                sh 'docker build -t driver-service:latest ./driver-service'
                sh 'docker build -t rider-service:latest ./rider-service'
                sh 'docker build -t ride-service:latest ./ride-service'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Logging into Docker Hub...'
                sh """
                    echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin
                """
                echo 'Pushing images to Docker Hub...'
                sh 'docker push payment-service:latest'
                sh 'docker push driver-service:latest'
                sh 'docker push rider-service:latest'
                sh 'docker push ride-service:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying services to Kubernetes cluster...'
                sh 'kubectl apply -f mongo-deployment.yaml'
                sh 'kubectl apply -f payment-deployment.yaml'
                sh 'kubectl apply -f driver-deployment.yaml'
                sh 'kubectl apply -f rider-deployment.yaml'
                sh 'kubectl apply -f ride-deployment.yaml'
            }
        }
    }
}
