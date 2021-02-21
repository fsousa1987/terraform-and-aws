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
