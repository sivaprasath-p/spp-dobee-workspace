
variable "env" {
  type = map(string)
  default = {
    dev  = "dev"
    prod = "prod"
  }
}

variable "region" {
  description = "Value for region defined here"
  type        = map(string)
  default = {
    dev  = "us-west-1"
    prod = "us-east-1"
  }
}

variable "instance_type" {
  description = "Value for instance_type defined here"
  default = {
    dev  = "t2.micro"
    prod = "t2.micro"
  }
}

variable "cider_block" {
  description = "cider block value for myVPC defined here"
  default = {
    dev  = "10.20.0.0/16"
    prod = "10.10.0.0/16"
  }
}
