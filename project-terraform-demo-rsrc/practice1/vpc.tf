
resource "aws_vpc" "myVPC1" {
  cidr_block = "${var.cider_block[terraform.workspace]}/16"
  instance_tenancy = "default"

  tags = {
    env = var.env[terraform.workspace]
  }
}

resource "aws_subnet" "myVPC1-pubSUB" {
  vpc_id     = aws_vpc.myVPC1.id
  cidr_block = "${var.cider_block[terraform.workspace]}/24"
}

resource "aws_subnet" "myVPC1-privSUB" {
  vpc_id     = aws_vpc.myVPC1.id
  cidr_block = "${var.cider_block[terraform.workspace]}/24"
}