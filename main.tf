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
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev3" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev 3"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev4" {
  ami = "ami-0996d3051b72b5b2c"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev 4"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
  depends_on = [ aws_s3_bucket.dev3 ]
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

resource "aws_s3_bucket" "dev3" {
  bucket = "franciscoedslabs-dev3"
  acl    = "private"

  tags = {
    Name = "franciscoedslabs-dev3"
  }
}
