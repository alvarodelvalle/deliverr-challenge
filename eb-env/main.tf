resource "aws_elastic_beanstalk_environment" "this" {
  for_each = var.eb_environments
  application         = var.eb_application
  name                = each.key
  solution_stack_name = var.solution_stack_name

  dynamic "setting" {
    for_each = [for s in var.settings : {
      namespace = s.namespace
      name      = s.name
      value     = s.value
    }]
    content {
      namespace = setting.value.namespace
      name = setting.value.name
      value = setting.value.value
    }
  }
}

resource "aws_db_instance" "this" {
  for_each = var.eb_environments
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.db_max_storage
  storage_type          = var.hd_storage_type
  engine                = var.db_engine
  engine_version        = var.db_version
  instance_class        = var.db_instance_class
  name                  = "${each.key}-${var.db_name}"
  username              = var.db_username
  password              = var.db_password
  parameter_group_name  = var.db_param_group_name
}
