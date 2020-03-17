node('master') {

	stage('git-checkout') {
		checkout changelog: false, 
		   scm: [$class: 'GitSCM', 
		   branches: [[name: '*/master']], 
		   doGenerateSubmoduleConfigurations: false, 
		   extensions: [], submoduleCfg: [], 
		   userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]]
	   }
	stage('maven-build') {
		sh label: '', script: 'mvn clean package'
	}

	stage('archive') {

		archiveArtifacts 'target/*.war'
	}
}