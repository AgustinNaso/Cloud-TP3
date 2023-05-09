module "vpc" {
  source        = "../modules/vpc"
  cidr_block    = "10.0.0.0/16"
  
  providers = {
    aws = aws.aws
  }
}
