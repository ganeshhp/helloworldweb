node ('master') {

  stage ('scm_checkout') {
    checkout([$class: 'GitSCM', 
      branches: [[name: '*/master']], 
      extensions: [], 
      userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
    }

  stage ('app_build') {
    sh 'mvn clean install'
    }

    input 'Proceed with deployment?'

  stage ('deploy_to_artifactory') {  
    sh '''curl -uuser1:APe8TNpyXKCb8VLuunDCEJab2 -T target/Helloworldwebapp-dev.war "https://ganeshpalnitkar.jfrog.io/artifactory/web-project/Helloworldwebapp-dev.war"
    '''
    }

  stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', followSymlinks: false
    }

}
