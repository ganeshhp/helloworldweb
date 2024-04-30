node ('master') {
    
  stage ('scm'){    
    checkout scmGit(branches: 
      [[name: '*/master']], extensions: [], 
      userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']])
  }
  
  stage ('app_build'){
    sh 'mvn clean install'
  }
  
  stage ('archive') {
    archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
  }
  
}
