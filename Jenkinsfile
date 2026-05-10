pipeline {
    agent any

    environment {
        IMAGE_NAME = "sync-service"
        REGISTRY = "your-ecr-repository"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: "${BRANCH_NAME}",
                url: 'https://github.com/your-org/sync-service.git'
            }
        }

        stage('Build Application') {
            steps {
                sh './mvnw clean package'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh './mvnw test'
            }
        }

        stage('Static Code Analysis') {
            steps {
                echo 'Running SonarQube analysis'
            }
        }

        stage('Security Scan') {
            steps {
                echo 'Running vulnerability scan'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t $REGISTRY/$IMAGE_NAME:$IMAGE_TAG .
                """
            }
        }

        stage('Push Docker Image') {
            steps {
                sh """
                docker push $REGISTRY/$IMAGE_NAME:$IMAGE_TAG
                """
            }
        }

        stage('Deploy to QA') {
            when {
                branch 'develop'
            }
            steps {
                sh './scripts/deploy.sh qa'
            }
        }

        stage('Deploy to Staging') {
            when {
                expression {
                    env.BRANCH_NAME.startsWith("release/")
                }
            }
            steps {
                sh './scripts/deploy.sh staging'
            }
        }

        stage('Production Approval') {
            when {
                branch 'main'
            }
            steps {
                input message: 'Approve production deployment?'
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                sh './scripts/deploy.sh prod'
            }
        }

        stage('Smoke Tests') {
            steps {
                echo 'Running smoke tests'
            }
        }
    }

    post {

        success {
            echo 'Deployment completed successfully'
        }

        failure {
            echo 'Deployment failed - initiating rollback'
            sh './scripts/rollback.sh'
        }
    }
}
