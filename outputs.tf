output "instance-Bastion" {
  value = aws_instance.EC2-Bastion-updated.public_ip
}

output "instance-Private" {
  value = aws_instance.EC2-private-1-T.private_ip
}
