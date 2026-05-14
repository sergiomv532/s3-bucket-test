provider "aws" {
  region = "us-east-1"
}

module "secure_storage" {
  source = "../../modules/secure-s3-bucket"

  bucket_name = "app-assets-data"
  environment = "prod"
  
  tags = {
    Owner       = "Platform Engineering"
    CostCenter  = "12345"
    DataPrivacy = "High"
  }
}