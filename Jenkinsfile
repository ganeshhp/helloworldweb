 def notify(status) {
   mail bcc: 'ganeshhp@gmail.com', 
     body: 'check the job status', 
     subject: "'Job status' ${status}:", 
     to: 'plusforum.in@gmail.com'
}

node ('master') {
  
  notify('build-started')

  stage ('SCM') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
   }
  
  stage ('maven-build') {
    sh 'mvn clean package'
   }

  notify('waiting-for-approval')

  input 'Approve for deployment'
  
  stage ('deploy') {
     sh 'curl -uuser1.plusforum:AP5LQczWPvpyUyPd9XWdiLu63W1 -L -O  "https://plusforumm.jfrog.io/artifactory/helloworld/Helloworldwebapp-dev.war"'
     sh 'cp ./Helloworldwebapp-dev.war /opt/tomcat/webapps/'
     sh '/opt/tomcat/bin/startup.sh'
  }
  
  notify('build-completed')
}
