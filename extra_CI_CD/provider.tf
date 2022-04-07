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
    key            = "cicd/terraform.tfstate"
    dynamodb_table = "app-state"
    encrypt        = "true"
    region         = "eu-west-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

