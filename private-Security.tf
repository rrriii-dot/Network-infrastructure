resource "aws_security_group" "PrivateSecurity" {
  name        = "PrivateSecurity"
  description = "Allow specific traffic"
  vpc_id      = module.MainNetwork.vpc_id 

  ingress {
    description = "Allow SSH from specific port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.MainNetwork.vpc_cidr]
    # ipv6_cidr_blocks = [aws_vpc.vpcTerraform.ipv6_cidr_block]
  }
  ingress {
    description = "Allow 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.MainNetwork.vpc_cidr]
    # ipv6_cidr_blocks = [aws_vpc.vpcTerraform.ipv6_cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-allow_SSH & port 3000"
  }
}