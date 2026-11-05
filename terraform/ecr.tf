# User Service Repository

resource "aws_ecr_repository" "user_service" {

  name                 = "${var.project_name}-user-service"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "User-Service"
    Environment = "DevOps"
  }
}

# Product Service Repository

resource "aws_ecr_repository" "product_service" {

  name                 = "${var.project_name}-product-service"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "Product-Service"
    Environment = "DevOps"
  }
}

# Order Service Repository

resource "aws_ecr_repository" "order_service" {

  name                 = "${var.project_name}-order-service"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "Order-Service"
    Environment = "DevOps"
  }
}
