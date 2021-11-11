provider "aws" {
  access_key = "AKIARL5NOOEUD44ZAM6J"
  secret_key = "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"
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

resource "aws_instance" "my_aws_ubuntu" {
  ami           = "ami-03d5c68bab01f3496"
#  instance_type = local.instance_type_map[terraform.workspace]
#  count = local.instance_count_map[terraform.workspace]
  instance_type = "t2.micro"
  tags = {
    name  = "netology_vinnirus_ubuntu"
    owner = "Nikita Vinogradov"
  }
}

resource "aws_instance" "my_debian" {
  for_each = local.instance_type_set
  ami = "ami-0c7ea5497c02abcaf"
  instance_type = each.key
  tags = {
    name  = "netology_vinnirus_debian"
    owner = "Nikita Vinogradov"
  }
  lifecycle {
    create_before_destroy = true
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
