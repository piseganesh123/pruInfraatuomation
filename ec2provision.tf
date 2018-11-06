# ganesh.pise
# Create a new instance of the Amazon AWS images
# t2.micro node with
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_sec_group" {
	type = "list"
}
variable "aws_pru_ami" {}
variable "aws_subnet" {}
variable "aws_keypairname" {}
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-1"
}
resource "aws_instance" "pruinfra" {
  ami           = "${var.aws_pru_ami}"
  instance_type = "t2.micro"
  security_groups	= "${var.aws_sec_group}"
  subnet_id	= "${var.aws_subnet}"
  key_name = "${var.aws_keypairname}"
	root_block_device {
		delete_on_termination = "true"
		volume_size = "20"
		volume_type = "gp2"
	}
	ephemeral_block_device {
		device_name = "/dev/sda1"
		virtual_name = "ephemeral0"
	}
	provisioner "file" {
		source      = "./src"
		destination = "/home/ec2-user"
	}
	provisioner "remote-exec" {
		inline = [
			# temporary fix - providing execute permission to all folders and files, in long run, only scripts needs execute permission
			"chmod +x /home/ec2-user/*",
			"sudo /bin/bash /home/ec2-user/quickStart.sh 2>&1 | tee -a ./provisioning.log",
			"echo \"Target server private IP is \" ${aws_instance.pruinfra.private_ip}"
			]
	}
	connection {
		user        = "ec2-user"
		#pre-requisite - please copy KeyPair file in parent directory where all code stored
		private_key = "${file("./../YOUR-KeyPair.pem")}"
	}
}