provider "aws" {
  region = "us-east-1"
}

module "secure_storage" {
  source = "../../modules/secure-s3-bucket"

  bucket_name = "app-assets-data"
  environment = "qa"
  
  tags = {
    Owner       = "Platform Engineering I"
    CostCenter  = "123456"
    DataPrivacy = "High"
  }
}