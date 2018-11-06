#!/bin/bash
#Install Terraform if not installed already
if hash terraform 2>/dev/null; then
	echo "Terraform is installed already, skipping ...."
else
	curl -O https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
	chmod 777 -R terraform_0.11.1_linux_amd64.zip
	yum -y install unzip
	unzip terraform_0.11.1_linux_amd64.zip -d /usr/bin/
	terraform -v
fi
#acceping security group as parameter (temporary solution - this needs to be passed as environment variable)
export TF_VAR_aws_sec_group='["yourgroup",]';
export TF_VAR_aws_pru_ami=ami-0ff8a91507f77f867;
export TF_VAR_aws_keypairname=YOUR-KeyPair
terraform init
if [[ "$1" == "destroy" ]]; then
        echo "Please note, infrastructure is being destroyed now !!!";
        terraform destroy
else
#       creating infrastructure as default option
        terraform apply
fi