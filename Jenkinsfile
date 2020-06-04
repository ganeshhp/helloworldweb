node ('master') {
	
	stage ('SCM_Checkout') {
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], submoduleCfg: [], 
		userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	}
	
    stage ('build') {	
	sh label: '', script: 'mvn clean package'
    }
	
	stage ('archive') {
	archiveArtifacts 'target/*.war'
    }
}