node ('buildserver') {
  
  stage ('scm_checkout') {  
	checkout([$class: 'GitSCM', 
	  branches: [[name: '*/master']], 
	  doGenerateSubmoduleConfigurations: false, 
	  extensions: [], submoduleCfg: [], 
	  userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	
	}
  input 'proceed with build ?'
  
  stage ('build') {

	sh label: '', script: 'mvn clean install'
	}
  stage ('archive') {
	archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
	}
}

