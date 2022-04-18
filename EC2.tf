
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
} 

resource "aws_instance" "EC2-Bastion-updated" {

     ami = data.aws_ami.ubuntu.id #ubuntu
     instance_type = "t2.micro"
    #availability_zone = "${var.availability_zone}a"
     subnet_id = module.MainNetwork.pub-sub-1-id
    key_name = "${var.name}-myKey"
    
  vpc_security_group_ids = [aws_security_group.PublicSecurity.id]

tags = {
    Name = "${var.name}-EC2-Bastion-update"
  }
 }

resource "aws_instance" "EC2-private-1-T" {

      ami = data.aws_ami.ubuntu.id #ubuntu
     instance_type = "t2.micro"
    #  availability_zone = "${var.availability_zone}a"
     subnet_id = module.MainNetwork.pri-sub-1-id
    key_name = "${var.name}-myKey"
  vpc_security_group_ids = [aws_security_group.PrivateSecurity.id]

tags = {
    Name ="${var.name}-EC2-private-1-T"
  }
 }


#  resource "aws_network_interface_sg_attachment" "sg_attachment" {
#   security_group_id    = aws_security_group.PublicSecurity.id
#   network_interface_id = aws_instance.EC2-Bastion.primary_network_interface_id
# }