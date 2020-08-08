
node ('Build-server') {
	
  stage ('checkout_scm') {	
	checkout([$class: 'GitSCM', 
	  branches: [[name: '*/master']], 
	  doGenerateSubmoduleConfigurations: false, 
	  extensions: [], submoduleCfg: [], 
	  userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	  
	  }
  
  input "do you want to Proceed with Build"
  
  stage ('build') {	  
	sh label: '', script: 'mvn install'
      }
	  
	  
  stage ('archive') {
	archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
	}
	
}
	
