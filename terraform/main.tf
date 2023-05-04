module "vpc" {
  source        = "./modules/vpc"
  cidr_block    = "10.0.0.0/16"

}

module "web_site" {
  source      = "./modules/web_site"
  src         = "./resources"
}
