pipeline {
    agent any
    stages {
        
        stage('execution') {
            steps {
                sh """
                docker image build -t nginx:1.0 .
                docker container run -d -P nginx:1.0
                docker container ls
                """
                
            }
        }
    }
}