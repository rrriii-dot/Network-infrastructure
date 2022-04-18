resource "aws_eip" "EIP-1" {
  vpc = true
  #   associate_with_private_ip = "10.0.0.12"
  depends_on = [aws_internet_gateway.igwTerraform]
}

