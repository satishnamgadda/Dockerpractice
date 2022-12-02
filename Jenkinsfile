pipeline {
    agent { label 'DCR'}
    stages {
        stage('vcs') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/satishnamgadda/Dockerpractice.git' 
            }
        }
        stage('execution') {
            steps {
                sh 'docker container run -d mynginx:latest sleep 1d'
                sh 'docker container ls'
                
            }
        }
    }
}