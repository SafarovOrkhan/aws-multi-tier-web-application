
resource "aws_iam_role" "ec2_simple_role" {
  name = "simple_ec2_role"

  assume_role_policy = local.iam_trust_policy
}

resource "aws_iam_role_policy" "ec2_simple_role_permissions" {
  name        = "ec2_bucket_pol"
  role   = aws_iam_role.ec2_simple_role.id
  policy = local.iam_permission_policy
}
