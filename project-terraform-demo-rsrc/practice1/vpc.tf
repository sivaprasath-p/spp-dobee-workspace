
resource "aws_vpc" "myVPC1" {
  cidr_block = var.cider_block[terraform.workspace]
  instance_tenancy = "default"

  tags = {
    env = var.env[terraform.workspace]
  }
}

resource "aws_subnet" "myVPC1-pubSUB" {
  
}

resource "aws_subnet" "myVPC1-privSUB" {
  
}