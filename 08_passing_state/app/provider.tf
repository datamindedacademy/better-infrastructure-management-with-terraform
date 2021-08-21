terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
  backend "s3" {
    bucket         = "better-infrastructure-management-with-terraform"
    key            = "passing_state/app/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "app-state"
    encrypt        = "true"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
}


