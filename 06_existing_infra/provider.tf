terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
  // TODO: repleace $YOURNAME with your own name! 
  backend "s3" {
    bucket  = "better-infrastructure-management-with-terraform"
    key     = "existing_infra/terraform-$YOURNAME.tfstate"
    region  = "eu-west-1"
    profile = "academy"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
}


