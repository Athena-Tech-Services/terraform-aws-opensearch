resource "aws_opensearch_domain_policy" "domain_policy" {
  domain_name     = aws_opensearch_domain.domain.domain_name
  access_policies = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "es:*",
      "Principal": "*",
      "Effect": "Allow",
      "Resource": "arn:aws:es:${local.aws_region}:${local.aws_account_id}:domain/${var.project_name}/*",
    }
  ]
}
POLICY
}