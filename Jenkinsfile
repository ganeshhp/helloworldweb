node ('master') {

    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
        
    sh 'mvn clean install'

    sh 'curl -uuser1:AP3wgCK5cmUdGA9uDryy7drWJrB -T target/Helloworldwebapp-dev.war "https://plussforum.jfrog.io/artifactory/helloworldwebapp-generic-local/Helloworldwebapp-dev.war"'

    archiveArtifacts artifacts: 'target/Helloworldwebapp-dev.war', 
        followSymlinks: false
        
    sh 'cp target/Helloworldwebapp-dev.war /opt/tomcat/webapps/'

}
