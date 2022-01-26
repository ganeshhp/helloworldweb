node ('master') {

    stage ('checkout_scm') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[credentialsId: 'github-user', 
        url: 'https://github.com/ganeshhp/helloworldweb.git']]])\
    }

    stage ('build') {
    sh 'mvn clean install'
    }

    stage ('deployToPackageRepo') {
    sh 'curl -uuser1:AP66t4pw1kd3V2Bky7e5NJJntcr -T ./Helloworldwebapp-dev.war "https://plusf.jfrog.io/artifactory/webapplication/Helloworldwebapp-dev.war"'
    }

    input 'Proceed with Archival?'
    
    stage ('archive') {
    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
        followSymlinks: false
    }

}
