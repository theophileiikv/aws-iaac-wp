# Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-web-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y ansible
              EOF
}

# Elastic IP for EC2
resource "aws_eip" "web_server" {
  instance = aws_instance.web_server.id
  vpc      = true

  tags = {
    Name = "${var.project_name}-web-server-eip"
  }
}
