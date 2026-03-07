resource "aws_iam_user" "myuser" {
  for_each = toset (["dev-demo", "qa-demo", "stg-demo", "prod-demo"])
  name = each.key
}
