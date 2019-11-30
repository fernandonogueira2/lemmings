data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  owners = ["aws-marketplace"]
}

resource "aws_instance" "ec2-a" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  associate_public_ip_address = var.assoc_pb_ip

  tags = {
    Name = var.ec2name
  }
}
