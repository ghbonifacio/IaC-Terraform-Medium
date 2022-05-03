resource "aws_instance" "ec2_teste" {
  ami                  = var.ami
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.iam_instance_intro.name

  network_interface {
      network_interface_id = aws_network_interface.nt_teste.id
      device_index         = 0
    }
  tags = var.tags
}

resource "aws_vpc" "vpc_teste" {
  cidr_block = "172.16.0.0/16"

  tags = var.tags
}

resource "aws_subnet" "subnet_teste" {
  vpc_id            = aws_vpc.vpc_teste.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = var.tags
}

resource "aws_network_interface" "nt_teste" {
  subnet_id   = aws_subnet.subnet_teste.id
  private_ips = ["172.16.10.100"]

  tags = var.tags
}

