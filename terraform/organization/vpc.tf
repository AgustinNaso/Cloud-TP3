module "vpc" {
  source        = "../modules/vpc"
  
  providers = {
    aws = aws.aws
  }
}
