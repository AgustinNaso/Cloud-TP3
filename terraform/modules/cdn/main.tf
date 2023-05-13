resource "aws_cloudfront_origin_access_identity" "static_website_OAI" {
  comment = "OAI for ${var.domain_name}"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
    #TODO API
    origin {
        domain_name              = var.bucket_regional_domain_name
        origin_id                = var.bucket_origin_id

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.static_website_OAI.cloudfront_access_identity_path
        }
    }

    enabled             = true
    is_ipv6_enabled     = var.ipv6_enable
    comment             = "Cloudfront CDN"
    default_root_object = "index.html"


    # aliases = var.aliases

    default_cache_behavior {
        allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods   = ["GET", "HEAD"]
        target_origin_id = var.bucket_origin_id
        viewer_protocol_policy = "redirect-to-https"

        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
        cache_policy_id        = data.aws_cloudfront_cache_policy.optimized_policy.id
    }

    # Cache behavior with precedence 0
    # ordered_cache_behavior {
    #     path_pattern     = "/content/immutable/*"
    #     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    #     cached_methods   = ["GET", "HEAD", "OPTIONS"]
    #     target_origin_id = local.s3_origin_id

    #     forwarded_values {
    #         query_string = false
    #         headers      = ["Origin"]

    #         cookies {
    #         forward = "none"
    #         }
    #     }

    #     min_ttl                = 0
    #     default_ttl            = 86400
    #     max_ttl                = 31536000
    #     compress               = true
    #     viewer_protocol_policy = "redirect-to-https"
    # }

    # Cache behavior with precedence 1
    # ordered_cache_behavior {
    # path_pattern     = "/content/*"
    #     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    #     cached_methods   = ["GET", "HEAD"]
    #     target_origin_id = local.s3_origin_id

    #     forwarded_values {
    #         query_string = false

    #         cookies {
    #         forward = "none"
    #         }
    #     }

    #     min_ttl                = 0
    #     default_ttl            = 3600
    #     max_ttl                = 86400
    #     compress               = true
    #     viewer_protocol_policy = "redirect-to-https"
    # }

    price_class = "PriceClass_100"

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    tags = {
        Name = "G3 CDN"
    }

    viewer_certificate {
        cloudfront_default_certificate = true

        # cloudfront_default_certificate = length(var.aliases) == 0

        # acm_certificate_arn      = var.certificate_arn
        # minimum_protocol_version = length(var.aliases) > 0 ? "TLSv1.2_2021" : null
        # ssl_support_method       = length(var.aliases) > 0 ? "sni-only" : null
    }
}