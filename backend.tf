terraform {
  backend "s3" {
    bucket = "backend-bucket-terraform-slave-r"
    key    = "TerraformStatus/Status.tfstate"
    region = "us-east-1"
  }
}
