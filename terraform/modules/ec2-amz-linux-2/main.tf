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
  subnet_id = var.pb_subnet_id
  associate_public_ip_address = var.assoc_pb_ip
  key_name = "lemmings"
  security_groups = [
    var.pb_sec_groups_id]

  tags = {
    Name = "EC2-A"
  }
}

resource "aws_instance" "ec2-b" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  subnet_id = var.pv_subnet_id
  associate_public_ip_address = "false"
  key_name = "lemmings"
  security_groups = [
    var.pv_sec_groups_id]

  tags = {
    Name = "EC2-B"
  }
}
