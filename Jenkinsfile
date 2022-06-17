node ('master') {
  
  stage ('SCM_Checkout') {
    checkout([$class: 'GitSCM', 
       branches: [[name: '*/master']], 
       extensions: [], 
       userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
  }

  stage ('build') {
    sh 'mvn clean install'
  }
  
 input 'Proceed with Archive?'

  stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
       followSymlinks: false
  }
    
}
