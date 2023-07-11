pipeline {
    agent {
        node {
            label 'ubuntu-slave1'
            }
      }
    stages {
        stage('Checkout Project..') {
            steps {
                git branch: 'master',
                    credentialsId: 'github_cred',
                    url: 'git@github.com:jokerwrld999/spring-music.git'

                sh "ls -lat"
            }
    }
        stage('Clean') {
            steps {
                echo "Cleaning up.."
                sh '''
                docker stop $(docker ps -a -q) || true
                docker rm $(docker ps -a -q) || true
                docker rmi -f $(docker images -aq) || true
                '''
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                docker build -t spring-music .
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying.."
                sh '''
                docker run -d -p 8080:8080 --name spring-music spring-music:latest
                sleep 30
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                ./custom-configs/test/test.sh
                '''
            }
        }
    }
}