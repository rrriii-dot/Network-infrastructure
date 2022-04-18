resource "aws_route_table" "publicRT-Terraform" {
  vpc_id = aws_vpc.vpcTerraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwTerraform.id
  }

  tags = {
    Name = "${var.name}-Public-Subnet-RT-Terraform"
  }
}

resource "aws_route_table_association" "Route-pub-1" {
  subnet_id      = aws_subnet.pubSubnet1.id
  route_table_id = aws_route_table.publicRT-Terraform.id
}

resource "aws_route_table_association" "Route-pub-2" {
  subnet_id      = aws_subnet.pubSubnet2.id
  route_table_id = aws_route_table.publicRT-Terraform.id
}