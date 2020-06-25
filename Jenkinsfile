node {
       stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
	git credentialsId: 'GitHubCredentials', url: 'https://github.com/jtakyar/AssigningTask.git'
       
    }
	 
    stage('Build image') {
	  sh 'docker build -t jtakyar/mydockerimgs .'
	    /* This builds the actual image */        
    }

    
    stage('Push image') {
        withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
        sh "docker login -u jtakyar -p ${docker-pwd}"
		 }
	 sh 'docker push jtakyar/mydockerimgs'
	     } 
 }
