resource "aws_elastic_beanstalk_application" "this" {
  name        = var.application_name
  description = var.application_description
}
