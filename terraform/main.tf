resource "aws_iam_group" "group" {
  name = "operations"
}

resource "aws_iam_group_policy_attachment" "apigw" {
  group      = aws_iam_group.group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_group_policy_attachment" "cw" {
  group      = aws_iam_group.group.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

