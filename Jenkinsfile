node {

stage ('SCM_checkout') {
	checkout([$class: 'GitSCM', 
		branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, 
		extensions: [], 
		submoduleCfg: [], 
		userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
	}

stage ('Build') {
	sh 'mvn clean package'
	}

stage ('archive') {
	archiveArtifacts 'target/*.war'
	}

}
