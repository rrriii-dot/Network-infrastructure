resource "aws_route_table" "privateRT-Terraform" {
    vpc_id = aws_vpc.vpcTerraform.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NATprivate.id
    }

    tags = {
        Name = "${var.name}-Private-Subnet-RT-Terraform"
    }
}

resource "aws_route_table_association" "Route-private-1" {
    subnet_id = aws_subnet.private-Subnet-1.id
    route_table_id = aws_route_table.privateRT-Terraform.id
}

resource "aws_route_table_association" "Route-private-2" {
    subnet_id = aws_subnet.private-Subnet-2.id
    route_table_id = aws_route_table.privateRT-Terraform.id
}

