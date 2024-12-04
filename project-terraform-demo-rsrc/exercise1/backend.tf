terraform {
  backend "s3" {
    bucket = "passhotmail1-s3-bucket"
    profile = "default"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "myDynamoDB"
    encrypt = true
  }
}