node ('buildserver') {
 
 stage ('checkout') {   
    checkout changelog: false, 
       poll: false, 
       scm: [$class: 'GitSCM', 
       branches: [[name: '*/master']], 
       doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], 
       userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]]
 }
 
 stage ('build') {
    sh 'mvn clean install'
 }

 input 'do you want proceed with archival'

 stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp.war', 
       followSymlinks: false
 }
    
}