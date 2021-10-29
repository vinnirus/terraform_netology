provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_aws_ubuntu" {
  ami           = "ami-03d5c68bab01f3496"
  instance_type = "t2.micro"
  tags = {
    name  = "netology_terraform"
    owner = "Nikita Vinogradov"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
