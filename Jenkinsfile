node {
    def app

    stage('Clone repository') {
        /* Clone Emoji repository */
	deleteDir() /* clean up our workspace */
	checkout scm
	sh 'pwd && ls'
	sh 'git clone --depth 1 https://github.com/ahfarmer/emoji-search.git'
	sh 'cp -r ./emoji-search/* .'
    }

    stage('Build image') {
        /* Builds image */
	sh "pwd"
	sh "ls"
        app = docker.build("pruemoji/first")
    }

    stage('Test image') {
        /* Basic Unit test with Npm*/
		
        }
    }

    stage('Push image') {
        /* Pushing image to Docker Hub */
        docker.withRegistry('https://registry.hub.docker.com', 'my-docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
	    deleteDir() /* clean up our workspace */	
        }
    }
