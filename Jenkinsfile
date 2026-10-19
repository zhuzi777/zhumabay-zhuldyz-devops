pipeline {
    agent any
    environment {
        STUDENT_NAME    = 'Zhuldyz'
        STUDENT_SURNAME = 'Zhumabay'
        STUDENT_GROUP   = 'IT2-2308'
        STUDENT_ID      = '37947'
        IMAGE           = 'zhumabay-zhuldyz-devops'
        CONTAINER       = 'zhumabay-zhuldyz-container'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                sh '''
                  echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                  echo "Group: $STUDENT_GROUP"
                  echo "Student ID: $STUDENT_ID"
                  chmod +x scripts/*.sh app/*.sh
                  ls -la
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                  test -f Dockerfile
                  test -f docker-compose.yml
                  test -f Zhumabay_Zhuldyz_info.txt
                  bash -n scripts/Zhumabay_Zhuldyz_system.sh
                  echo "All checks passed"
                '''
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Docker Run') {
            steps {
                sh '''
                  docker rm -f $CONTAINER || true
                  docker run --name $CONTAINER \
                    -e STUDENT_NAME=$STUDENT_NAME \
                    -e STUDENT_SURNAME=$STUDENT_SURNAME \
                    -e STUDENT_GROUP=$STUDENT_GROUP \
                    -e STUDENT_ID=$STUDENT_ID \
                    $IMAGE
                  docker ps -a --filter name=$CONTAINER
                '''
            }
        }
    }
}
