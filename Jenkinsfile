pipeline { 
    agent none 
    stages {
        stage('SCM_Chekout') {
            agent {label 'master'} 
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
            agent {label 'master'}
            steps {
                bat 'mvn -f pom.xml clean package' 
            }
        }
     }
}
