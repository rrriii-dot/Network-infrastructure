resource "aws_subnet" "private-Subnet-1" {
  vpc_id = aws_vpc.vpcTerraform.id

  availability_zone       = "${var.availability_zone}a"
  map_public_ip_on_launch = false
  cidr_block              = var.private-Subnet-1_cidr
  tags = {
    Name = "${var.name}-private-Subnet-1-T"
  }
}

resource "aws_subnet" "private-Subnet-2" {
  vpc_id            = aws_vpc.vpcTerraform.id
  availability_zone = "${var.availability_zone}b"

  map_public_ip_on_launch = false
  cidr_block              = var.private-Subnet-2_cidr
  tags = {
    Name = "${var.name}-private-Subnet-2-T"
  }
}
