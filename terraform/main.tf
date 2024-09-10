terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket                  = "lifi-sandbox-tf-state"
    key                     = "state"
    region                  = "eu-north-1"
    shared_credentials_file = "~/.aws/credentials"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
  access_key = "Insert_access_key"
  secret_key = "Insert_secret_key"
}
