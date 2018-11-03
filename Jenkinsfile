node {
    def app

    stage('Clone repository') {
        /* Clone Emoji repository */

        checkout scm
    }

    stage('Build image') {
        /* Builds image */

        app = docker.build("pruDevOps/Emoji1")
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
}