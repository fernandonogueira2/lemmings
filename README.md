# lemmings

-- Complete AWS VPC using terraform modules --

---- Internet Gateway, Nat Gateway, Elastic IP, Public and Private Subnets, Security Groups, Route tables, EC2s -----

terraform version = v0.12.16

This exercise creates a VPC attached to an Internet Gateway and also adds 2 Subnets, (one public and one private, each one with its own route table)
and two amazon linux 2 EC2s (t2.micro EC2-A and EC2-B) using public and private IPs. As the Public Subnet has internet access, to make it secure the
only allowed IP address allowed to access port 22 (ssh) is MyIP (a configurable variable in terraform module created so you can use your own).

EC2-A has public (and private) IP addresses, therefore is accessible via internet, whilst EC2-B is private and only accessible via 
EC2-A instance due to its connection to the private subnet.

The private subnet have internet access through Nat Gateway and has it's own route table and it's own security group allowing connection within MyVPC
context only, making it accessible only when using EC2-A as the "jump-box". 

To make if a bit more fun you can also ping EC2-B from EC2-A host. 

P.S: Before use this code you will have to generate your own pem file and name it as lemmings unless 
you change ec2-amz-linux-2 module and choose your own name, up to you. You will also need to add your own IP address as a variable to the network module otherwise
you won't be able to connect to the EC2. 

To use it this code, simply open a terminal in : /path_do_repository/lemmings/environments/dev/ec2-amz-linux-2, and run:
terraform init 
terraform apply

To destroy all resources, from the same path run:
terraform destroy 

Feel free to contact me at any time, remember this is just an exercise and might not suit for production usage.

# Change log
|V1.0.0 Initial Dev VPC only.|

|V1.1.0 VPC with Single Public Subnet.|

|v1.2.0 Adding EC2-A centos to public VPC.|

|v1.3.0 Changing EC2-A to amazon-linux and adding security group to restrict access to MyIP.|

|v1.3.1 Fixing some variables and folder names and adding a small documentation.|

|v1.4.0 Adding private EC2-B and its own subnet, route table and security group.|

|v1.5.0 Adding NAT Gateway for the private subnet security access the internet.|

