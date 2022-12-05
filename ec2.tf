resource "aws_instance" "Test-serve-1pub" {
  ami                         = var.aws_instance-Test-serve-1pub
  instance_type               = "t2.micro"
  key_name                    = "Newsshkeypair"
  vpc_security_group_ids      = [aws_security_group.Test-sec-group2.id]
  subnet_id                   = aws_subnet.Test-public-sub1-cidr_block.id
  associate_public_ip_address = true

  tags = {
    name = "Test-serve-1pub"
  }
}

resource "aws_instance" "Test-serve-2prv" {
  ami                         = var.aws_instance-Test-serve-2prv
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Test-priv-sub1-cidr_block.id
  associate_public_ip_address = true
  tenancy                     = "default"

  tags = {
    name = "Test-serve-2prv"
  }
}


