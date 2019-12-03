resource "aws_vpc" "myVPC1" {
  cidr_block                       = var.cidr
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  enable_classiclink               = var.enable_classiclink

  tags = merge(
  {
    "Name" = format("%s", var.vpc_name)
  },
  var.tags,
  var.vpc_tags,
  )
}

resource "aws_internet_gateway" "myIGW1" {
  vpc_id = aws_vpc.myVPC1.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_subnet" "myPublicSubnet" {
  vpc_id = aws_vpc.myVPC1.id
  cidr_block = var.pb_cidr

  tags = {
    Name = var.pb_subname
  }
}

resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  description = "Allow ssh inbound traffic"
  vpc_id = aws_vpc.myVPC1.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["141.168.175.126/32"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myVPC1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIGW1.id
  }

  tags  = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "pb_route" {
  subnet_id = aws_subnet.myPublicSubnet.id
  route_table_id = aws_route_table.public_rt.id
}
