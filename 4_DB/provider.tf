terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  # backend "s3" {
  #   bucket = "gspann-s3-remote-state"
  #   key = "Gspann-dev-db"
  #   region = "us-east-1"
  #   dynamodb_table = "gspann-lock-system"
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}