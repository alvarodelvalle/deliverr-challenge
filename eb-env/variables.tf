variable "eb_environments" {
  description = "A map or set of strings list of environments for the application"
}

variable "settings"{
  default = [
    {
      namespace = "aws:elasticbeanstalk:environment:proxy"
      name = "ProxyServer"
      value = "nginx"
    },
    {
      namespace = "aws:ec2:instances"
      name = "InstanceTypes"
      value = "t3.micro, t3.small"
    }
  ]
  description = "Environment options per https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html"
}

variable "solution_stack_name" {}

variable "eb_application" {}

variable "db_allocated_storage" {
  default = 20
}

variable "db_max_storage" {
  default = 100
}

variable "hd_storage_type" {
  default = "gp2"
}

variable "db_engine" {
  type = string
}

variable "db_version" {
  type = string
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_name" {}

variable "db_username" {
  default = "admin"
}

variable "db_password" {}

variable "db_param_group_name" {}
