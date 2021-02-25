variable "amis" {
  type = map

  default = {
      "us-east-2" = "ami-0996d3051b72b5b2c"
      "us-east-1" = "ami-047a51fa27710816e"
  }
}

variable "cdirs_acesso_remoto" {
  type = list
  default = ["45.224.199.47/32","46.224.199.47/32"]
}

variable "key_name" {
    default = "terraform-aws"
}