#-------------------------------------------------------------------------------
resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.project}-VPC"
  }
}
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.network.id
  availability_zone       = data.aws_availability_zones.current.names[0]
  map_public_ip_on_launch = true
  cidr_block              = var.pub_sub_a_cidr_block
  tags = {
    Name = "${var.project}-Public-SubnetA"
  }
}
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.network.id
  availability_zone = data.aws_availability_zones.current.names[0]
  cidr_block        = var.priv_sub_a_cidr_block
  tags = {
    Name = "${var.project}-Private-SubnetA"
  }
}
resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.network.id
  availability_zone       = data.aws_availability_zones.current.names[1]
  map_public_ip_on_launch = true
  cidr_block              = var.pub_sub_b_cidr_block
  tags = {
    Name = "${var.project}-Public-SubnetB"
  }
}
resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.network.id
  availability_zone = data.aws_availability_zones.current.names[1]
  cidr_block        = var.priv_sub_b_cidr_block
  tags = {
    Name = "${var.project}-Private-SubnetB"
  }
}
#-------------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "${var.project}-IGW"
  }
}
#--------------------------------------------------------------------------
resource "aws_route_table" "public_route_table_a" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = aws_vpc.network.cidr_block
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project}-Public-Route-Table-A"
  }
}
resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = aws_vpc.network.cidr_block
    gateway_id = "local"
  }
  tags = {
    Name = "${var.project}-Private-Route-Table-A"
  }
}
resource "aws_route_table" "public_route_table_b" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = aws_vpc.network.cidr_block
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project}-Public-Route-Table-B"
  }
}
resource "aws_route_table" "private_route_table_b" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = aws_vpc.network.cidr_block
    gateway_id = "local"
  }
  tags = {
    Name = "${var.project}-Private-Route-Table-B"
  }
}
#-------------------------------------------------------------------------------
resource "aws_route_table_association" "public_route_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table_a.id
}
resource "aws_route_table_association" "private_route_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_route_table_a.id
}
resource "aws_route_table_association" "public_route_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_route_table_b.id
}
resource "aws_route_table_association" "private_route_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_route_table_b.id
}
