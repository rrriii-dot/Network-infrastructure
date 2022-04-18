
resource "aws_subnet" "pubSubnet1" {
  vpc_id = aws_vpc.vpcTerraform.id

  availability_zone       = "${var.availability_zone}a"
  map_public_ip_on_launch = true
  cidr_block              = var.pubSubnet1_cidr
  tags = {
     Name = "${var.name}-pubSubnet1"
  }
}

resource "aws_subnet" "pubSubnet2" {
  vpc_id            = aws_vpc.vpcTerraform.id
  availability_zone = "${var.availability_zone}b"

  map_public_ip_on_launch = true
  cidr_block              = var.pubSubnet2_cidr
  tags = {
    Name = "${var.name}-pubSubnet2"
  }
}

