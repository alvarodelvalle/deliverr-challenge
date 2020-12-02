terraform {
  backend "local" {}
}

provider "aws" {
  region = "us-east-1"
}

variable "db_password" {
  description = "The RDS DB admin password. Set this via CLI or auto.tfvars"
}

module "eb_geolocator_application" {
  source = "./.."
  application_description = "Geolocator uses a requests IP address to identify the clients location"
  application_name = "Geolocator"
}

module "eb_geolocator_dev_environments" {
  source = "./../eb-env"
  eb_application = module.eb_geolocator_application.app_name
  eb_environments = toset(["dev1", "dev2"])
  solution_stack_name ="64bit Amazon Linux 2 v5.2.3 running Node.js 12"
  settings = [
    {
      namespace = "aws:elasticbeanstalk:environment:proxy"
      name = "ProxyServer"
      value = "nginx"
    },
    {
      namespace = "aws:ec2:instances"
      name = "InstanceTypes"
      value = "t3.micro, t3.small"
    },
    {
      namespace = "aws:elasticbeanstalk:application:environment"
      name = "NODE_ENV"
      value = "production"
    }
  ]
  db_engine = "mysql"
  db_name = "geolocator"
  db_param_group_name = "default.mysql8.0"
  db_password = var.db_password
  db_version = "8.0"
}
