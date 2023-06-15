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
                echo "doing build stuff.."
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                echo "doing test stuff.."
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
    }
}