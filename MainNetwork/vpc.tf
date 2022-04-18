resource "aws_vpc" "vpcTerraform" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.name}-mainvpcT"
  }
  enable_dns_hostnames = true
  enable_dns_support   = true
}