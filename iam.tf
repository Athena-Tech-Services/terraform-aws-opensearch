
resource "aws_iam_role" "service_linked_role" {
  name = "iam_for_opensearch_${var.project_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "opensearchservice.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

data "aws_iam_policy" "opensearch_policy" {
  arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonOpenSearchServiceRolePolicy"

}

resource "aws_iam_role_policy_attachment" "service_linked_role_attachment" {
  role       = aws_iam_role.service_linked_role.name
  policy_arn = data.aws_iam_policy.opensearch_policy.arn
}
