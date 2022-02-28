terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
  // TODO: replace $YOURNAME with your own name! 
  backend "s3" {
    bucket  = "better-infrastructure-management-with-terraform"
    key     = "existing_infra/terraform-jan.tfstate"
    region  = "eu-west-1"
    profile = "academy"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
}


