resource "aws_security_group" "web_sg" {
  name        = "ww-sg"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "org" {
  ami           = "ami-00a8151272c45cd8e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name      = "slkey"

  tags = {
    Name        = "web-server"
    Environment = "dev"
    Owner       = "DevOps"
    Project     = "terraform-demo"
  }
}
