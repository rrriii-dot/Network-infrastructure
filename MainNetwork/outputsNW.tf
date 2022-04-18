output pub-sub-1-id {
    value = aws_subnet.pubSubnet1.id
}
output pub-sub-2-id {
    value = aws_subnet.pubSubnet2.id
}

output pri-sub-1-id {
  value = aws_subnet.private-Subnet-1.id
}

output pri-sub-2-id {
  value = aws_subnet.private-Subnet-2.id
}
output vpc_id {
  value = aws_vpc.vpcTerraform.id
}
output vpc_cidr {
  value = aws_vpc.vpcTerraform.cidr_block

}
# output availability_zone {
#   value =

# }