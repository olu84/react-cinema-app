provider "aws" {
  region = "eu-west-2"

}

terraform {
  backend "s3" {
    bucket  = "chronicles-app-cinema-tf-state"
    key     = "app-cinema-tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Olumide Alabi"
  }
}
