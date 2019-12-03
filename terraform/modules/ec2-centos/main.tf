data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "ec2-a" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  associate_public_ip_address = var.assoc_pb_ip
  key_name = "lemmings"
  security_groups = ["${var.sec_groups_id}"]

  tags = {
    Name = var.ec2name
  }
}
