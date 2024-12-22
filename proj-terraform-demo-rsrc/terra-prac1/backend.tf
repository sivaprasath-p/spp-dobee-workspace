terraform {
  backend "s3" {
    bucket         = "dobee-terraform"
    key            = "practice1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dobee-terraform-statelocking"
  }
}