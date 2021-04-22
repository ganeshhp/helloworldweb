pipeline { 
    agent none 
    stages {
        stage('SCM_Chekout') {
            agent {master} 
            steps { 
                checkout([$class: 'GitSCM', 
                    branches: [[name: '*/master']], 
                    doGenerateSubmoduleConfigurations: false, 
                    extensions: [], 
                    submoduleCfg: [], 
                    userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
            }
        }
        stage('Build'){
            agent {master}
            steps {
                sh 'mvn -f pom.xml clean package' 
            }
        }
        stage('Deploy') {
            agent {master}
            steps {
                sh 'cp target/*.war /opt/tomcat/webapps/'
                sh '/opt/tomcat/bin/catalina.sh run'

            }
        }
    }
}
