provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev ${count.index}"
  }
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    description = "acesso-ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["45.224.199.47/32"]
  }

  tags = {
    Name = "ssh"
  }
}
