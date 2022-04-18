terraform {
  backend "s3" {
    bucket = "backend-bucket-terraform"
    key    = "TerraformStatus/Status.tfstate"
    region = "us-east-1"
  }
}