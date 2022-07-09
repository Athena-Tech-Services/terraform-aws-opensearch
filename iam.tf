resource "aws_iam_service_linked_role" "service_role" {
  aws_service_name = "opensearchservice.amazonaws.com"
}
