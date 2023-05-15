# #https://www.youtube.com/watch?v=RRdYFwlCHic TODO VOLAR ESTO
# #pedir el certificado
# resource "aws_acm_certificate" "this" {
#   domain_name               = var.domain_name
#   subject_alternative_names = ["www.${var.domain_name}"]
#   validation_method         = "DNS"

#    lifecycle {
#     create_before_destroy = true
#   }
# }

# #record set de r53 para validacion de dominio
# resource "aws_route53_record" "this" {
#   for_each = {
#     for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
#       name    = dvo.resource_record_name
#       record  = dvo.resource_record_value
#       type    = dvo.resource_record_type
#     }
#   }

#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.this.zone_id
# }

# #validar certificado acm
# resource "aws_acm_certificate_validation" "this" {
#   certificate_arn         = aws_acm_certificate.acm_certificate.arn
#   validation_record_fqdns = [for record in aws_route53_record.route53_record : record.fqdn]
# }
