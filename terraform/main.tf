module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = "10.0.0.0/16"
  
  providers = {
    aws = aws.aws
  }
}

module "static_website" {
  source      = "./modules/static_website"
  src         = "./resources"

  providers = {
    aws = aws.aws
  }
}
