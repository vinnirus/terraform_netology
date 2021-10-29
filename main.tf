provider "aws" {}

resource "aws_instance" "my_aws_ubuntu" {
  ami           = "ami-00d1ab6b335f217cf"
  instance_type = "t2.micro"
  tags = {
    name = "netology_terraform"
    owner = "Nikita Vinogradov"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

