node {
    def app

    stage('Clone repository') {
        /* Clone Emoji repository */
	deleteDir() /* clean up our workspace */
	checkout scm /* checkout code from https://github.com/piseganesh123/pruInfraatuomation.git which holds Dockerfile */
	sh 'git clone --depth 1 https://github.com/ahfarmer/emoji-search.git'
	sh 'cp -r ./emoji-search/* .'  /* copy emoji code into directory where Dockerfile is kept" */
    }

    stage('Build image') {
        /* Builds image */
        app = docker.build("pruemoji:${env.BUILD_NUMBER}")
    }

    stage('Test image') {
        /* Basic Unit test with Npm*/
		
        }
    
   stage('Run image') { 
	   sh 'docker run -d -p 3000:3000 pruemoji:$BUILD_NUMBER'
     }
    stage('Push image') {
        /* Pushing image to Docker Hub */
        docker.withRegistry('https://registry.hub.docker.com', 'my-docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            /* app.push("latest") */ 
	    deleteDir() /* clean up our workspace */	
        }
    }
}
