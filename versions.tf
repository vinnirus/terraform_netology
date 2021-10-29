terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      alias = "west"
      region = "us-west-2"
    }
  }
}