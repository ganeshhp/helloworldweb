node {
 parallel {
  stage ('SCM_checkout') {
    
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], 
		submoduleCfg: [], 
		userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	}
  stage ('SCM_checkout-webapp') {
    
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], 
		submoduleCfg: [], 
		userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldapp.git']]])
	}
stage ('Build') {
	sh 'mvn clean package'
	}

stage ('archive') {
	archiveArtifacts 'target/*.war'
	}

}
