provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "CustomVPC"
  }
}

# Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.custom_vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "IGW"
  }
}

# Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Security Group (Allow SSH and HTTP)
resource "aws_security_group" "ec2_sg" {
  name        = "EC2SecurityGroup"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2SecurityGroup"
  }
}

# Amazon Linux EC2 Instance
resource "aws_instance" "amazon_ec2" {
  ami           = var.amis["amazon_linux"]
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.key_name
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "MyAmazonLinuxVM"
  }
}

# Ubuntu EC2 Instance
resource "aws_instance" "ubuntu_ec2" {
  ami           = var.amis["ubuntu"]
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.key_name
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "MyUbuntuVM"
  }
}
