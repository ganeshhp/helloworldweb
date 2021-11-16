('master') {

  stage ('scm_checkout') {  
    checkout([$class: 'GitSCM', 
            branches: [[name: '*/master']], 
            extensions: [], 
            userRemoteConfigs: [[url: 'https://github.com/ganeshhp/Maven-petclinic-project.git']]])
  }

  stage ('build') {
    sh 'mvn clean install'
  }
  
  input 'Proceed with Deployment?'

  stage ('artifactory') {
     sh 'curl -uganeshhp@gmail.com:AP4g3Wxp8znReDy8f3eVsSqDRjE -T target/petclinic.war "https://plussforum.jfrog.io/artifactory/petclinic-generic-local/petclinic.war"'
  }

  stage ('archive') {
    archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
  }
}
