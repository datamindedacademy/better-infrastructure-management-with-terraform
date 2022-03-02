terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
  assume_role {
    role_arn = "arn:aws:iam::338791806049:role/exercise_02_role"
  }
}