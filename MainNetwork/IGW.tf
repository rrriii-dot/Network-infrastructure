resource "aws_internet_gateway" "igwTerraform" {
  vpc_id = aws_vpc.vpcTerraform.id

  tags = {
    Name = "${var.name}-mainigwT"
  }
}