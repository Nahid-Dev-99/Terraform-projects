terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-nahid"
    key    = "word-press/terraform.tfstate"
    region = "eu-west-2"
  }
}

# Configure the AWS Provider
provider "aws" {
   #configuration options
   region = "eu-west-2"
}