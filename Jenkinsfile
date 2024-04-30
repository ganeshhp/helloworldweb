node ('build_server') {
    
  stage ('scm'){    
    checkout scmGit(branches: 
      [[name: '*/master']], extensions: [], 
      userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']])
  }
  
  stage ('app_build'){
    sh 'mvn clean install'
  }

  input 'provide approval for archiving'
    
  stage ('archive') {
    archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
  }
  
}
