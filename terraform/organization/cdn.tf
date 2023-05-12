module "cdn" {
  source            = "../modules/cdn"
  aliases           = ["www.${local.website_domain}", local.website_domain]
  domain_name       = local.website_domain
  bucket_origin_id  = module.static_website.website_bucket_id
  bucket_domain_name = module.static_website.website_bucket_domain_name
  certificate_arn    = module.certificates.certificate_arn
}
