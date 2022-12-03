pipeline {
    agent any
    stages {
        
        stage('execution') {
            steps {
                sh """
                docker image build -t nginx:1.0 .
                """
                
            }
        }
    }
}