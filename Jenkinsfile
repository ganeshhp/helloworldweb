
node ('buildserver') {

    checkout([$class: 'GitSCM', 
        branches: [[name: '*/master']], 
        extensions: [], 
        userRemoteConfigs: [[credentialsId: 'plusforum', 
        url: 'https://gitlab.com/ganeshhp/helloworldweb.git']]])

    sh 'mvn clean install'
  
}




