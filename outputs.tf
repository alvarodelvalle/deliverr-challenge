output "app_name" {
  value = aws_elastic_beanstalk_application.this.name
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}
