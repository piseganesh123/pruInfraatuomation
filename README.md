# PruDevOps For NodeJs based applications
 
Pre-Requisite
1. AWS EC2 AMI
2. Docker Hub access and its credentials in Jenkins with Global access as "my-docker-hub-credentials"

How to:
1. Create EC2 instace on AWS using Terraform script as mentioned below (some manual actions are yet to automate and test like like creating ./src directory and coping jenkinsfile and dockerfile there 
Also need to update Provisionginfra.sh and ec2provision.tf script with appropriate keypair and AWS specific paramter values manually
$sudo sh ./provisionInfra.sh
2. Install docker and git on AWS EC2 instance (Amazon AMI image) using quickstart.sh script. This also installs and starts ckerised Jenkins image
$sudo sh ./quickstart.sh
3. Log in into jenkins, credentials needs to be copied from Jenkins container for first time
4. Create Pipeline job pointing SCM to https://github.com/piseganesh123/pruInfraatuomation.git
5. Run Jenkins Job

This builds nodejs application available on https://github.com/ahfarmer/emoji-search.git, packages it and runs it as containers and upload's package on Dockerhub

Tools Used:
1. Docker v18
2. Jenkins v2
3. git
4. Terraform

Future plans:
1. Use docker slave to run Jenkins Jobs (Jobs are running on Jenkins Master)
2. Vulnerability test for containers being pushed on DockerHub as part of CI/CD pipeline
3. Error handling in JenkinsPipeline