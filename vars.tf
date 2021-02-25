variable "amis" {
  type = map

  default = {
      "us-east-2" = "ami-0996d3051b72b5b2c"
      "us-east-1" = "ami-047a51fa27710816e"
  }
}