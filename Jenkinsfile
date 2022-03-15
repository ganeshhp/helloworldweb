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
  
  stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
        followSymlinks: false
        
  }
  
  input 'Proceed with Deployment?'
  
  stage ('deploy-to-artifactory') {
    sh 'curl -uuser1:AP78JGyu7hG9NZr1o4rNbnCQ2MY -T target/Helloworldwebapp-dev.war "https://automationfactory.jfrog.io/artifactory/helloworld/Helloworldwebapp-dev.war"'
  }
      
  }
