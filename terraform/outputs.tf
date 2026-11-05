# EC2 Instance ID

output "ec2_instance_id" {

  description = "EC2 Instance ID"

  value = aws_instance.microservices_ec2.id
}

# EC2 Public IP

output "ec2_public_ip" {

  description = "EC2 Public IP"

  value = aws_instance.microservices_ec2.public_ip
}

# EC2 Public DNS

output "ec2_public_dns" {

  description = "EC2 Public DNS"

  value = aws_instance.microservices_ec2.public_dns
}

# User Service ECR URL

output "user_service_ecr_url" {

  value = aws_ecr_repository.user_service.repository_url
}

# Product Service ECR URL

output "product_service_ecr_url" {

  value = aws_ecr_repository.product_service.repository_url
}

# Order Service ECR URL

output "order_service_ecr_url" {

  value = aws_ecr_repository.order_service.repository_url
}

# IAM Role

output "ec2_iam_role" {

  value = aws_iam_role.ec2_ecr_role.name
}

# Security Group ID

output "security_group_id" {

  value = aws_security_group.microservices_sg.id
}
