node 'master' {

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

stage ('deploy') {
	sh '''cp target/Helloworldwebapp.war /opt/apache-tomcat-8.5.21/webapps
	/opt/apache-tomcat-8.5.21/bin/shutdown.sh
	/opt/apache-tomcat-8.5.21/bin/startup.sh'''
	}

}
