provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "vinnirus1tfstate"
    key = "terraform.tfstate"
    region = "us-west-2"
  }
}

locals {
  instance_type_map = {
    stage = "t2.micro"
    prod = "t3.micro"
  }
  instance_count_map = {
    stage = 1
    prod = 2
  }
  instance_type_set = toset([
    "t2.micro",
    "t3.micro",
  ])
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "my_debian"
  instance_count = 2

  ami                    = "ami-0c7ea5497c02abcaf"
  instance_type          = "t2.micro"

  subnet_id = "vinnirus_subnet"

  tags = {
    name  = "netology_vinnirus_aws_debian"
    owner = "Nikita Vinogradov"
  }
}

resource "aws_s3_bucket" "my_terraform_state" {
  bucket = "vinnirus1tfstate"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "app-state"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
