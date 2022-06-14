node ('master') {
  

  stage ('SCM') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
   }
  
  stage ('maven-build') {
    sh 'mvn clean package'
   }


  input 'Proceed With Archival'

  stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
      followSymlinks: false
  }

}
 
