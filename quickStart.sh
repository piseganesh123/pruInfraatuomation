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
yum -y install git 
#docker-engine-1.12.6-1.el7.centos.x86_64
