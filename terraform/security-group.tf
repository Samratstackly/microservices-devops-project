resource "aws_security_group" "microservices_sg" {

  name        = "${var.project_name}-sg"
  description = "Security group for microservices EC2"
  vpc_id      = data.aws_vpc.default.id

  # SSH Access

  ingress {
    description = "SSH from approved IP"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = [var.ssh_allowed_cidr]
  }

  # HTTP Access

  ingress {
    description = "HTTP access"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS Access

  ingress {
    description = "HTTPS access"

    from_port = 443
    to_port   = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Traffic

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Microservices-Security-Group"
  }
}
