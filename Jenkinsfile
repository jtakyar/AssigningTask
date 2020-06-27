node {
       stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
	git credentialsId: 'GitHubCredentials', url: 'https://github.com/jtakyar/AssigningTask.git'
       
    }
		 
    stage('Build image') {
	  sh 'whoami'
	  sh 'docker build -t jtakyar/mydockerjenkinsimgs:v1.1 .'
	    /* This builds the actual image */        
    }

    
    stage('Push image') {
	    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
 	       sh "docker login -u jtakyar -p ${dockerHubPwd}"
		 }
	 sh 'docker push jtakyar/mydockerjenkinsimgs:v1.1 '
	     } 
   stage('Run Container on local server'){
     sh 'docker run -p 8181:8181 -d --name my-webapp jtakyar/mydockerjenkinsimgs:v1.1 '
     
     }
 }
