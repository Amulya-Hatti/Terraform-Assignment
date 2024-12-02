resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/private-key.pem"
}

resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "custom-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}
