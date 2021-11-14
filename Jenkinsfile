
node ('buildserver') {

  stage ('SCM_checkout') {
    checkout([$class: 'GitSCM',
        branches: [[name: '*/master']],
        extensions: [],
        userRemoteConfigs: [[credentialsId: 'plusforum',
        url: 'https://github.com/ganeshhp/helloworldweb.git']]])
  }

  stage ('maven_build') {
      sh 'mvn clean install'
  }

  input 'Proceed or Abort'

}

