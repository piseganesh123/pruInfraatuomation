# pruInfraatuomation

Pre-Requisite
1. Docker Hub access and its credentials in Jenkins with Global accesss as "my-docker-hub-credentials"
2. AWS EC2 AMI

How to:
1. Install docker and git on AWS EC2 instance (Amazon AMI image) using quickstart.sh script. This also installs and starts dockerised Jenkins image
$sudo sh ./quickstart.sh
2. Log in into jenkins, credentials needs to be copied from Jenkins container for first time
3. Create Pipeline job pointing SCM to https://github.com/piseganesh123/pruInfraatuomation.git
4. Run Jenkins Job

This build nodejs application available on https://github.com/ahfarmer/emoji-search.git, packages it and runs it as containers and upload's package on Dockerhub

Tools Used:
1. Docker 
2. Jenkins
3. git

Future plans:
1. Use docker slave instead of running jobs  on Master
2. Vulnerability test for containers being pushed on DockerHub as part of CI/CD pipeline
