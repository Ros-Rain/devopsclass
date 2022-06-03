pipeline {

	agent any

    environment {
        NEXUS_IP = '192.168.3.71'
        NEXUS_PORT = '8081'
        NEXUS_INSTANCE_ID = 'dz-nexus'
        NEXUS_REPOSITORY = "vpro-maven-release"
        NEXUS_GROUP = "QA"
        FILE_PATH = 'target/vprofile-v2.war'
        ARTIFACT_ID = 'vprofile'
        VERSION = "${env.BUILD_TIMESTAMP}-${env.BUILD_ID}"
    }

    stages{

        stage('BUILD'){
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: FILE_PATH
                }
            }
        }

	stage('UNIT TEST'){
            steps {
                sh 'mvn test'
            }
        }

	stage('INTEGRATION TEST'){
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
        }

        stage ('CODE ANALYSIS WITH CHECKSTYLE'){
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                success {
                    echo 'Generated Analysis Result'
                }
            }
        }

        stage("Publish to Nexus Repository Manager") {
          steps {
            nexusPublisher nexusInstanceId: NEXUS_INSTANCE_ID,
                           nexusRepositoryId: NEXUS_REPOSITORY,
                           packages: [[$class: 'MavenPackage',
                                       mavenAssetList: [[classifier: '', extension: '', filePath: FILE_PATH]],
                                       mavenCoordinate: [artifactId: ARTIFACT_ID, groupId: NEXUS_GROUP, packaging: 'war', version: VERSION]
                                     ]]
          }
        }

    }
}
