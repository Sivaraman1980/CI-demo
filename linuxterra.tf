pipeline {
    agent any
    
    stages {
        stage('Clean and Prepare Work Directory') {
            steps {
                echo "Cleaning and preparing the work directory..."
                sh 'rm -rvf /tmp/test1920'
                sh 'mkdir -p /tmp/test1920'
            }
        }
        
        stage('Clone Repository') {
            steps {
                echo "Cloning the Terraform repository..."
                sh 'git clone https://github.com/Sivaraman1980/CI-demo/blob/main/ /tmp/test1920'
            }
        }
        
        stage('Terraform Infrastructure Setup') {
            steps {
                dir('/tmp/test1920') {
                    echo "Initializing Terraform..."
                    sh 'terraform init'
                    
                    echo "Applying Terraform changes..."
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}

