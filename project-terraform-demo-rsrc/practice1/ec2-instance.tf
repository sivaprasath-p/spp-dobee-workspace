
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "linux-key" {
  key_name   = "linux-vm"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE1DKS0dtEzh87j5tjLRI64wke37uJBbWc7b6PDbZ7Jt sivap@JEEVA"
}

resource "aws_instance" "ubuntu-vm1" {

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = 0.0031
    }
  }

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type[terraform.workspace]
  key_name      = aws_key_pair.linux-key.id
  hibernation = true
  subnet_id = 
  vpc_security_group_ids = [  ]

  tags = {
    name = "ubuntu-amd64-1"
  }

  provisioner "local-exec" {
    when = create

    command = <<EOT
      "echo ${self.public_ip} >> server-public-ip.txt"
      "echo ${self.public_ip} has been successfully created through Terraform in ${var.region[terraform.workspace]}"
    EOT

    on_failure = continue
  }
}