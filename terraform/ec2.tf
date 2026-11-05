resource "aws_instance" "microservices_ec2" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.microservices_sg.id
  ]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  root_block_device {

    volume_size = var.root_volume_size

    volume_type = "gp3"

    encrypted = true
  }

  # Install Docker and AWS CLI

  user_data = <<-EOF
              #!/bin/bash

              set -eux

              apt-get update

              apt-get install -y \
                docker.io \
                docker-compose-v2 \
                awscli

              systemctl enable docker

              systemctl start docker

              usermod -aG docker ubuntu

              EOF

  tags = {
    Name        = "${var.project_name}-ec2"
    Environment = "DevOps"
  }
}
