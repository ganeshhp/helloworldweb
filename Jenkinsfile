
node ('master') {

    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[credentialsId: 'plusforum', 
        url: 'https://gitlab.com/plusforum/helloworldweb.git']]])
   
    sh 'mvn clean install'

    sh 'cp target/*.war /opt/tomcat/webapps/'

    archiveArtifacts artifacts: 'target/*.war', 
       followSymlinks: false
}




