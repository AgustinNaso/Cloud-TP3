# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"

#   domain_name  = var.domain_name
#   zone_id      = data.aws_route53_zone.main.id
#   validation_method = "DNS"

#   subject_alternative_names = ["www.${var.domain_name}"]

#   wait_for_validation = true

#   tags = {
#     Name = "my-domain.com"
#   }
# }