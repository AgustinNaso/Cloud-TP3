module "static_website" {
  source      = "../modules/static_website"
  src         = "./resources"

  providers = {
    aws = aws.aws
  }
}