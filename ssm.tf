
# Trust policy allowing EC2 to assume the role
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# IAM role for Systems Manager
resource "aws_iam_role" "ssm_role" {
  name = "capstone-project-01-ssm-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

# Attach AWS-managed SSM permissions
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profile used to attach role to EC2
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "capstone-project-01-ssm-profile"
  role = aws_iam_role.ssm_role.name
}
