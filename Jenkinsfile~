node ('appserver') {
  
  stage ('scm_checkout') {
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], submoduleCfg: [], 
		userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	}
	
  stage ('Build') {
	sh label: '', script: 'mvn clean package'
    }
	
  stage ('archive') {
	archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
    }
	
}
