variable "vpc_id" {
  description = "VPC for Project 16"
  type        = string
  default     = "vpc-03389c41f719f68ac"
}

variable "public_subnet_ids" {
  description = "Public subnets in two availability zones"
  type        = list(string)
  default = [
    "subnet-02a246541c0a65ad4",
    "subnet-0391feeb69966b00f"
  ]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "certificate_arn" {
  description = "Approved ACM certificate ARN for a domain you control"
  type        = string
}
