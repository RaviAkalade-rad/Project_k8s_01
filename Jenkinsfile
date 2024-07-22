pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker_creads')
    }
    stages { 

        stage('Build image') {
            steps {  
                sh 'docker build -t ravidocker0507/flaskapp:$BUILD_NUMBER .'
            }
        }
        stage('Test image'){
            steps {
                 echo 'Empty'
            }
        }
        stage('Connecting to DockerHub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push image') {
            steps{
                sh 'docker push ravidocker0507/flaskapp:$BUILD_NUMBER'
            }
        }
        stage('deploy app on k8s'){
            steps{
                sh 'cubectl apply -f app_deployment.yml'
            }
        }    
}
post {
        always {
            sh 'docker logout'
        }
    }
}