node ('master') {
  stage ('checkout') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
    }

  stage ('build') {
    sh 'mvn clean install'
    }
  stage ('deploy_to_artifactory') {
    sh 'curl -uuser1:AP3wgCK5cmUdGA9uDryy7drWJrB -T target/Helloworldwebapp-dev.war "https://plussforum.jfrog.io/artifactory/helloworldwebapp-generic-local/Helloworldwebapp-dev.war"'
   }

  stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
        followSymlinks: false
    }

  input 'Proceed with Deployment?'

  stage ('deploy') {
    sh 'cp target/Helloworldwebapp-dev.war /opt/tomcat/webapps/'
    }
}
