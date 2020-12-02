# deliverr-challenge

## Requirements
terraform >= 0.13.0, < 0.14.0
aws provider ~> 3.18.0

## Usage
_Applications_
```hcl
module "eb_geolocator_application" {
  source = "./.."
  ...
```

_Application environments_
```hcl
module "eb_geolocator_dev_environments" {
  source = "./../eb-env"
  eb_application = module.eb_geolocator_application.app_name
  eb_environments = toset(["dev1", "dev2"])
  ...
```

* Set `settings =[]` for environments that are copies of one another eg: dev1 dev2; Create a separate 
  module for say production environments.
* Set the DB password in *.auto.tfvars
* The settings for the environment depend on the solution stack see [aws docs](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-specific.html)
