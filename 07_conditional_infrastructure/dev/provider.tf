terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "better-infrastructure-management-with-terraform"
    key    = "conditional_infra/dev/terraform.tfstate"
    region = "eu-west-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
}


