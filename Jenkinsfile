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
              //  ./run/start.sh
                echo "Deploying.."
                sh '''
                pwd
                java -jar -Dserver.port=8090 -Dspring.profiles.active=mongodb /home/jokerwrld/jenkins_slave/workspace/Spring-music-Pipeline/build/libs/spring-music-1.0.jar & echo $! > ./pid1.file &
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                curl -I https://spring-music.com
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