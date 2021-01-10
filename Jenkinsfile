node ('buildserver') {
    
    stage ('SCM_checkout') {
        checkout([$class: 'GitSCM', 
           branches: [[name: '*/master']], 
           doGenerateSubmoduleConfigurations: false, 
           extensions: [], submoduleCfg: [], 
           userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
    }
    
    stage ('build') {
    sh 'mvn clean install'
    }

    input 'do you want to proceed'

    stage ('archive') {
    archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
    }
}

