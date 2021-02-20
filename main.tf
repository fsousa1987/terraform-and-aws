provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  ami = "ami-0ade3e6d496de298f"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
}
