node {
    def app

    stage('Clone repository') {
        /* Clone Emoji repository */
        checkout scm
	bash '''
	    git clone --depth 1 https://github.com/ahfarmer/emoji-search.git
	'''    
    }

    stage('Build image') {
        /* Builds image */
	bash '''
		pwd
		ls
	'''
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
        }
    }
