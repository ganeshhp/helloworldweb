
node ('master') {

  stage ('SCM') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[credentialsId: 'plusforum', 
        url: 'https://gitlab.com/plusforum/helloworldweb.git']]])
  }

  stage ('build') { 
    sh 'mvn clean install'
  }

  stage ('deploy-to-tomcat') {
    sh 'cp target/*.war /opt/tomcat/webapps/'
  }

  stage ('archive') {
    archiveArtifacts artifacts: 'target/*.war', 
       followSymlinks: false
  }

}




