// Welcome to Ecercise1 of integrating terraform with jenkins
// starting with creating security group for ec2 instance
resource "aws_security_group" "sg1" {
  name = "sg1"
  ingress {
    description = "TLS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg1"
  }
}
// Creating ec2 instance and configuring custome web server using random webpage template
resource "aws_instance" "ec2-demo" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.ZONE1
  vpc_security_group_ids = [aws_security_group.sg1.id]
  tags = {
    Name    = "Terraform-Jenkins-Demo1"
    Project = "Demo"
  }
}

resource "local_file" "name" {
  content  = aws_instance.ec2-demo.public_ip
  filename = "pubip.txt"
}

output "Message" {
  value = "Tasks are Successfully Executed"
}
