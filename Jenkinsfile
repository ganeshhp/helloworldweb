node {

stage ('scm') {
checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
}

stage ('build') {
sh 'mvn -f pom.xml clean package'

}

stage ('archive') {
archiveArtifacts 'target/*.war'
}

}