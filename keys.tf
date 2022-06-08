resource "tls_private_key" "private_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "${var.name}-myKey" # Create "myKey" to AWS!!
  public_key = tls_private_key.private_key_pair.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.private_key_pair.private_key_pem}' > $HOME/.ssh/${var.name}-myKey.pem && chmod 600 ~/.ssh/${var.name}-myKey.pem"
  }
}

# resource "aws_key_pair" "public_key_pair" {
#   key_name   = "public-key_pair"
#   public_key = tls_private_key.private_key_pair.public_key_openssh
#  tags = {
#     Name = "public-keypair"
#   }
# }

# resource "aws_secretsmanager_secret" "private_key2" {
#   name = "private_key2"
# }

# resource "aws_secretsmanager_secret" "public_key2" {
#   name = "public_key2"
# }

# resource "aws_secretsmanager_secret_version" "private_key_value" {
#   secret_id     = aws_secretsmanager_secret.private_key2.id
#   secret_string = tls_private_key.private_key_pair.private_key_pem
# }

# resource "aws_secretsmanager_secret_version" "public_key_value" { 
#   secret_id     = aws_secretsmanager_secret.public_key2.id
#   secret_string = aws_key_pair.public_key_pair.public_key
# }
