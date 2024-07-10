resource "aws_iam_role" "iam-role" {
  name               = "ECS-execution-role_csr"
  assume_role_policy = file("${path.module}/iam-role.json")
}