resource "aws_opensearch_domain_policy" "domain_policy" {
  domain_name     = aws_opensearch_domain.domain.domain_name
  access_policies = <<POLICIES
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "${aws_opensearch_domain.domain.arn}/*"
    }
  ]
}
POLICIES
}