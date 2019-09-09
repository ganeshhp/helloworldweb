node {

 stage ('scm_checkout') {
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], submoduleCfg: [], 
		userRemoteConfigs: [[url: 'C:\\Project\\helloworldweb']]])
  }

 stage ('build') {  
	bat label: '', script: 'mvn clean package'
  }
  
  stage ('archive') {
	archiveArtifacts 'target/*.war'
  }
  
}
