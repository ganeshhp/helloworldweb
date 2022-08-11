node ('master') {
  stage ('SCM') {
    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[url: 'https://github.com/ganeshhp/helloworldweb.git']]])
    }

  stage ('build') {
    sh 'mvn clean install'
  }
  
  emailext body: 'Approve the deployment request', subject: 'Approval', to: 'abc@gmail.com'

  input 'Proceed with Deployment to Artifactory?'

  stage ('artifactory') {
    sh '''curl -uuser1:APe8TNpyXKCb8VLuunDCEJcab2 -T target/Helloworldwebapp-dev.war "https://ganeshpalnitkar.jfrog.io/artifactory/webapp-package/Helloworldwebapp-dev.war"'''
  }

}
