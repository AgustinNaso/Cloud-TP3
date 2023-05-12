module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = ["www.${var.domain_name}"]

  wait_for_validation = true

  tags = {
    Name = var.domain_name
  }
  create_route53_records  = false
  validation_record_fqdns = module.route53_records.validation_route53_record_fqdns
}

module "route53_records" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  create_certificate          = false
  create_route53_records_only = true

  distinct_domain_names = module.acm.distinct_domain_names

  zone_id = data.aws_route53_zone.main.id
  acm_certificate_domain_validation_options = module.acm.acm_certificate_domain_validation_options
}