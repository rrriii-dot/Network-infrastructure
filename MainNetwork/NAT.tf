
resource "aws_nat_gateway" "NATprivate" {
  allocation_id = aws_eip.EIP-1.id
  subnet_id     = aws_subnet.pubSubnet2.id

  tags = {
    Name = "${var.name}-Terraform-NAT-1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igwTerraform]
}


