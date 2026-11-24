
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "capstone"
}

locals {
  vpc_id = "vpc-03389c41f719f68ac"

  subnet_ids = [
    "subnet-02a246541c0a65ad4",
    "subnet-0391feeb69966b00f"
  ]

  common_tags = {
    Project   = "20"
    Owner     = "Shreeyansh-verma"
    ManagedBy = "Terraform"
  }
}

data "aws_ssm_parameter" "al2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Application Load Balancer security group
resource "aws_security_group" "alb" {
  name        = "shreeyansh-p20-alb-sg"
  description = "Allow HTTP requests to Project 20 ALB"
  vpc_id      = local.vpc_id

  ingress {
    description = "Public HTTP"
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

  tags = merge(local.common_tags, {
    Name = "shreeyansh-p20-alb-sg"
  })
}

# EC2 security group
resource "aws_security_group" "web" {
  name        = "shreeyansh-p20-web-sg"
  description = "Allow HTTP only from Project 20 ALB"
  vpc_id      = local.vpc_id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "shreeyansh-p20-web-sg"
  })
}

# Two EC2 instances in separate Availability Zones
resource "aws_instance" "web" {
  count = 2

  ami                         = data.aws_ssm_parameter.al2023.value
  instance_type               = "t3.micro"
  subnet_id                   = local.subnet_ids[count.index]
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/user-data.sh", {
    server_name = "EC2-Server-${count.index + 1}"
  })

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = true
  }

  tags = merge(local.common_tags, {
    Name = "shreeyansh-p20-web-${count.index + 1}"
  })
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "shreeyansh-p20-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb.id]
  subnets         = local.subnet_ids

  tags = merge(local.common_tags, {
    Name = "shreeyansh-p20-alb"
  })
}

# Target group and health checks
resource "aws_lb_target_group" "web" {
  name        = "shreeyansh-p20-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = local.common_tags
}

# Register both instances with the target group
resource "aws_lb_target_group_attachment" "web" {
  count = 2

  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

# HTTP listener forwards traffic to the target group
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

output "alb_url" {
  value = "http://${aws_lb.main.dns_name}"
}

output "target_group_arn" {
  value = aws_lb_target_group.web.arn
}

output "ec2_instance_ids" {
  value = aws_instance.web[*].id
}
