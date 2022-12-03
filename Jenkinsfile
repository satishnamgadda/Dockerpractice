pipeline {
    agent any
    stages {
        
        stage('execution') {
            steps {
                sh """
                docker image build -t apache:1.0 .
                docker container run -d -P apache:1.0
                docker container ls
                """
                
            }
        }
    }
}