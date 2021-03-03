terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "franciscoedslabs"

    workspaces {
      name = "terraform-and-aws"
    }
  }
}