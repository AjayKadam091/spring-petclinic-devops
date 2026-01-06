pipeline {
    agent any

    tools {
        maven 'maven-3.9.0'
        jdk 'jdk-17'
    }

    environment {
        DOCKER_IMAGE = "ajay383/spring-petclinic"
        DOCKER_TAG   = "${BUILD_NUMBER}"
    }

    stages {

        stage("Checkout"){
            steps{
                echo "checkout the source code from github"
                git branch: "main",
                    url: "https://github.com/AjayKadam091/spring-petclinic.git"

            }

        }
        stage("Build"){
            steps{
                sh 'mvn clean package -DskipTests'
            }
            
        }
        stage("Test"){
            steps{
                sh 'mvn test'
            }
            
        }
        stage("Build Docker Image"){
           steps{
            sh '''
            docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
            docker tag $DOCKER_IMAGE:$DOCKER_TAG $DOCKER_IMAGE:latest
            '''
            }
        }

         stage("Push Docker Image"){
           steps { 
            withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]){
                    sh '''
                        docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
                        docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                        docker push $DOCKER_IMAGE:latest
                    '''
                }
           }
           
           post{
               success{
                   echo "✅ Build and push successful !"
               }
               failure{
                   echo "❌ Pipeline failed !"
               }
           }
        }
    }

}
