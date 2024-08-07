node{
    //discard build and poll SCM
    
    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '10', daysToKeepStr: '', numToKeepStr: '10')), pipelineTriggers([pollSCM('* * * * *')])])
    
    def mavenHome=tool name:"maven 3.9.8"
    stage('git checkout')
    {
        git branch: 'airtel-testing', credentialsId: '2d2dd16e-8cf0-40f4-8c69-035861550cdb', url: 'https://github.com/santoshimarkal/maven-web-app-project-kk-funda.git'
    }
    stage('Build')
    {
     sh "${mavenHome}/bin/mvn clean package"   
    }
      stage('SQ report')
    {
     sh "${mavenHome}/bin/mvn clean sonar:sonar"   
    }
        stage('nexus deploy')
    {
     sh "${mavenHome}/bin/mvn clean deploy sonar:sonar"   
    }
    stage('deploy to tomcat'){
    sshagent(['e3c1562b-bd86-4d10-805d-6bd1cf5238ce']) {
     sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@13.60.94.49://opt/apache-tomcat-9.0.91/webapps/"

}

}
}//node closing
