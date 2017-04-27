node {
   
   stage('SCM') { 
        build 'SCM'
   }

   stage('Build') {
        build 'build'
   }  

   stage('deploy') {
        build 'TOMCAT-deployment'
   }

    
}