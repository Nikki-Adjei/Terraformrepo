


# Create a VPC
resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Prod-rock-VPC"
  }
}

# Create a subnets
resource "aws_subnet" "Test-public-sub1-cidr_block" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Test-public-sub1-cidr_block

  tags = {
    Name = "Test-public-sub1"
  }
}

resource "aws_subnet" "Test-public-sub2-cidr_block" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Test-public-sub2-cidr_block

  tags = {
    Name = "Test-public-sub2"
  }
}

resource "aws_subnet" "Test-priv-sub1-cidr_block" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Test-priv-sub1-cidr_block

  tags = {
    Name = "Test-priv-sub1"
  }
}

resource "aws_subnet" "Test-priv-sub2-cidr_block" {
  vpc_id     = aws_vpc.Prod-rock-VPC.id
  cidr_block = var.Test-priv-sub2-cidr_block

  tags = {
    Name = "Test-priv-sub2"
  }
}

# Create route table
resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-pub-route-table"
  }
}

resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-priv-route-table"
  }
}

# Create route table association
resource "aws_route_table_association" "Test-pub-route-table1" {
  subnet_id      = aws_subnet.Test-public-sub1-cidr_block.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "Test-pub-route-table2" {
  subnet_id      = aws_subnet.Test-public-sub2-cidr_block.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "Test-priv-route-table1" {
  subnet_id      = aws_subnet.Test-priv-sub1-cidr_block.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

resource "aws_route_table_association" "Test-priv-route-table2" {
  subnet_id      = aws_subnet.Test-priv-sub2-cidr_block.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Create internet gateway
resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# Internet Gateway and Route table association
resource "aws_route" "Test-pub-route-table" {
  route_table_id         = aws_route_table.Test-pub-route-table.id
  destination_cidr_block = var.aws_route-Test-pub-route-table
  gateway_id             = aws_internet_gateway.Test-igw.id
}

# Create EIP
resource "aws_eip" "lb" {
  domain   = "vpc"
}

# Create Nat Gateway
/*resource "aws_nat_gateway" "Test-Nat-gateway1" {
  subnet_id         = aws_subnet.Test-public-sub1-cidr_block.id
  connectivity_type = "private"

  tags = {
    Name = "Test-Nat-gateway1"
  }
} */

resource "aws_nat_gateway" "Test-Nat-gateway2" {
  allocation_id = aws_eip.Test-eip.id
  subnet_id     = aws_subnet.Test-public-sub2-cidr_block.id

  tags = {
    Name = "Test-Nat-gateway2"
  }
}

# Create security group
resource "aws_security_group" "Test-sec-group1" {
  description = var.aws_security_group-Test-sec-group1
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description = "ssh access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Test-sec-group2" {
  description = var.aws_security_group-Test-sec-group2
  vpc_id      = aws_vpc.Prod-rock-VPC.id

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}







