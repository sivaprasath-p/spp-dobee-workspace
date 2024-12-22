variable "REGION" {
  type    = string
  default = "us-east-2"
}

variable "ZONE1" {
  type    = string
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0574da719dca65348"
    us-east-2 = "ami-0a606d8395a538502"
  }
}

variable "INSTANCE_TYPE" {
  type    = string
  default = "t2.micro"
}

variable "USER" {
  type    = string
  default = "root"
}