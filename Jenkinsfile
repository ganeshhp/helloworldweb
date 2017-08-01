node {
      stage('SCM')
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
      stage('Build') 
        sh 'mvn -f pom.xml clean package'
      stage('deploy')
        archiveArtifacts 'target/*.war'
     
}
