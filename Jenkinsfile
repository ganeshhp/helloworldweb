

node ('buildserver') {

        checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        doGenerateSubmoduleConfigurations: false, 
        extensions: [], submoduleCfg: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])

        sh 'mvn clean install'

        archiveArtifacts artifacts: 'target/*.war', followSymlinks: false

}

