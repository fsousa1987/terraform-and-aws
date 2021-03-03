provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev ${count.index}"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev3" {
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev 3"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh.id ]
}

resource "aws_instance" "dev5" {
  provider = aws.us-east-1
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev 5"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh-us-east-1.id ]
  depends_on = [ aws_dynamodb_table.dynamodb-homologacao ]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-1
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
    "Name" = "dev 6"
  }
  vpc_security_group_ids = [ aws_security_group.acesso-ssh-us-east-1.id ]
}

resource "aws_s3_bucket" "homologacao" {
  bucket = "franciscoedslabs-homologacao"
  acl = "private"

  tags = {
    "Name" = "franciscoedslabs-homologacao"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-1
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}
