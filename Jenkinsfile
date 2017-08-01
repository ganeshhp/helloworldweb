node {
      stage('SCM') {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
      }
      stage('Build') {
        bat 'mvn -f pom.xml clean package'
      }
      stage('Archive') {
        archiveArtifacts 'target/*.war'
      }
}
