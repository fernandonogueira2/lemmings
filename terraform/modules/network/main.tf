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
  var.vpc_tags
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

resource "aws_subnet" "myPrivateSubnet" {
  vpc_id = aws_vpc.myVPC1.id
  cidr_block = var.pv_cidr

  tags = {
    Name = var.pv_subname
  }
}

resource "aws_security_group" "allow-ssh-pb" {
  name = "allow-ssh-pb"
  description = "Allow ssh inbound traffic"
  vpc_id = aws_vpc.myVPC1.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [var.mypub_ip_address]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-pb"
  }
}

resource "aws_security_group" "allow-ssh-pv" {
  name = "allow-ssh-pv"
  description = "Allow ssh inbound traffic"
  vpc_id = aws_vpc.myVPC1.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [var.pb_cidr]
  }

  ingress {
    cidr_blocks = [var.pb_cidr]
    protocol = "icmp"
    from_port = 8
    to_port = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-pv"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myVPC1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIGW1.id
  }

  tags  = {
    Name = var.pb_rt_name
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.myVPC1.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myNatGateway.id
  }

  tags  = {
    Name = var.pv_rt_name
  }
}

resource "aws_route_table_association" "pb_route" {
  subnet_id = aws_subnet.myPublicSubnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pv_route" {
  subnet_id = aws_subnet.myPrivateSubnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_eip" "myNatGateway" {
  vpc = true

  depends_on = [
    aws_internet_gateway.myIGW1
    ]

  tags = {
    Name = "natGateway-eip"
  }
}

resource "aws_nat_gateway" "myNatGateway" {
  allocation_id = aws_eip.myNatGateway.id
  subnet_id = aws_subnet.myPublicSubnet.id

  depends_on = [
  aws_internet_gateway.myIGW1
  ]

  tags = {
    Name = "myNatGateway"
  }
}
