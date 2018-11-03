#!/bin/bash

#Install docker , git tos server

sudo yum update -y
echo ################## Configuring Package Repositories ##################"
cat > /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

#Run Docker’s installation script:
yum -y install git docker
#wget and java required for local Jenkins installatnion only, for dockerised version this is not required
yum install wget java
#docker-engine-1.12.6-1.el7.centos.x86_64
systemctl start docker

#Build emoji image
sudo docker build . -t emoji-test:2
docker run -it -p 3000:3000 emoji-test:2