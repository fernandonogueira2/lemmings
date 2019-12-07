# lemmings
terraform version = v0.12.16
aws provider v2.40.0

Terraform modules to various services

This exercise creates a VPC attached to an Internet Gateway and also adds a Public Subnet and a amazon linux 2 EC2 (t2.micro).
The Public Subnet has is own Route Table and a Security Group with a fixed IP address (MyIP) to prevent access 
from any other hosts to the EC2 created.

P.S: Before use this code you will have to generate your own pem file and name it as lemmings unless 
you change ec2-amz-linux-2 module and choose your own. You will also need to add your own IP address to the network module otherwise
you won't be able to connect to the EC2. 

To use it, open a terminal in : /path_do_repository/lemmings/environments/dev/ec2-amz-linux-2, and run:
terraform init 
terraform apply

To destroy all resources, from the same path run:
terraform delete 

# Change log
|V1.0.0 Initial Dev VPC only.|
|V1.1.0 VPC with Single Public Subnet.|
|v1.2.0 Adding EC2-A centos to public VPC.|
|v1.3.0 Changing EC2-A to amazon-linux and adding security group tos restrict access to MyIP.|
|v1.3.1 Fixing some variables and folder names and adding a small documentation.|
