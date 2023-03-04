# provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# vpc
resource "aws_vpc" "modules_ii_vpc" {
  cidr_block       = var.modules_ii_vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# igw
resource "aws_internet_gateway" "modules_ii_igw" {
  vpc_id = aws_vpc.modules_ii_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# ngw_1
resource "aws_nat_gateway" "modules_ii_ngw1" {
  allocation_id = aws_eip.modules_ii_eip1.id
  subnet_id     = aws_subnet.modules_ii_priv_sub1.id

  tags = {
    Name = "${var.project_name}-ngw1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.modules_ii_igw]
}

# ngw_2
resource "aws_nat_gateway" "modules_ii_ngw2" {
  allocation_id = aws_eip.modules_ii_eip2.id
  subnet_id     = aws_subnet.modules_ii_priv_sub2.id

  tags = {
    Name = "${var.project_name}-ngw2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.modules_ii_igw]
}

# eips
resource "aws_eip" "modules_ii_eip1" {
  #instance = aws_instance.web.id
  vpc      = true
}

resource "aws_eip" "modules_ii_eip2" {
  #instance = aws_instance.web.id
  vpc      = true
}

# pub subnets
resource "aws_subnet" "modules_ii_pub_sub1" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_pub_sub1_cidr_block
  availability_zone = var.modules_ii_pub_sub1_availability_zone

  tags = {
    Name = "${var.project_name}pub_sub1"
  }
}

resource "aws_subnet" "modules_ii_pub_sub2" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_pub_sub2_cidr_block
  availability_zone = var.modules_ii_pub_sub2_availability_zone

  tags = {
    Name = "${var.project_name}pub_sub2"
  }
}

# priv subnets
resource "aws_subnet" "modules_ii_priv_sub1" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_priv_sub1_cidr_block
  availability_zone = var.modules_ii_priv_sub1_availability_zone

  tags = {
    Name = "${var.project_name}priv_sub1"
  }
}

resource "aws_subnet" "modules_ii_priv_sub2" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_priv_sub2_cidr_block
  availability_zone = var.modules_ii_priv_sub2_availability_zone

  tags = {
    Name = "${var.project_name}priv_sub2"
  }
}

resource "aws_subnet" "modules_ii_priv_sub3" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_priv_sub3_cidr_block
  availability_zone = var.modules_ii_priv_sub3_availability_zone

  tags = {
    Name = "${var.project_name}priv_sub3"
  }
}

resource "aws_subnet" "modules_ii_priv_sub4" {
  vpc_id     = aws_vpc.modules_ii_vpc.id
  cidr_block = var.modules_ii_priv_sub4_cidr_block
  availability_zone = var.modules_ii_priv_sub4_availability_zone

  tags = {
    Name = "${var.project_name}-priv_sub4"
  }
}

# pub route table
resource "aws_route_table" "modules_ii_pub_rt" {
  vpc_id = aws_vpc.modules_ii_vpc.id

  route {
    cidr_block = var.modules_ii_pub_rt_cidr_block
    gateway_id = aws_internet_gateway.modules_ii_igw.id
  }

/*   route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  } */

  tags = {
    Name = "${var.project_name}-pub_rt"
  }
}

# priv route tables
resource "aws_route_table" "modules_ii_priv_rt1" {
  vpc_id = aws_vpc.modules_ii_vpc.id

  route {
    cidr_block = var.modules_ii_priv_rt1_cidr_block
    nat_gateway_id = aws_nat_gateway.modules_ii_ngw1.id
  }

/*   route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  } */

  tags = {
    Name = "${var.project_name}-priv_rt1"
  }
}

resource "aws_route_table" "modules_ii_priv_rt2" {
  vpc_id = aws_vpc.modules_ii_vpc.id

  route {
    cidr_block = var.modules_ii_priv_rt2_cidr_block
    nat_gateway_id = aws_nat_gateway.modules_ii_ngw2.id
  }

/*   route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  } */

  tags = {
    Name = "${var.project_name}-priv_rt2"
  }
}

# pub route associations
resource "aws_route_table_association" "pub_route_asso1" {
  subnet_id      = aws_subnet.modules_ii_pub_sub1.id
  route_table_id = aws_route_table.modules_ii_pub_rt.id
}

resource "aws_route_table_association" "pub_route_asso2" {
  subnet_id      = aws_subnet.modules_ii_pub_sub2.id
  route_table_id = aws_route_table.modules_ii_pub_rt.id
}

# priv route associations
resource "aws_route_table_association" "priv_route_asso1" {
  subnet_id      = aws_subnet.modules_ii_priv_sub1.id
  route_table_id = aws_route_table.modules_ii_priv_rt1.id
}

resource "aws_route_table_association" "priv_route_asso2" {
  subnet_id      = aws_subnet.modules_ii_priv_sub3.id
  route_table_id = aws_route_table.modules_ii_priv_rt1.id
}

resource "aws_route_table_association" "priv_route_asso3" {
  subnet_id      = aws_subnet.modules_ii_priv_sub2.id
  route_table_id = aws_route_table.modules_ii_priv_rt2.id
}

resource "aws_route_table_association" "priv_route_asso4" {
  subnet_id      = aws_subnet.modules_ii_priv_sub4.id
  route_table_id = aws_route_table.modules_ii_priv_rt2.id
}

# load balancer
