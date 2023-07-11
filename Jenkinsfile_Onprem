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
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                ./gradlew clean assemble
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying.."
                sh '''
                export SRC=$(pwd)
                ./custom-configs/deployment/deploy.sh
                sleep 10
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