module "log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket_prefix = "logs"
  acl           = "log-delivery-write"
  force_destroy = true

  attach_deny_insecure_transport_policy = true #TODO DENY NON SSL TRANSPORT
  attach_require_latest_tls_policy      = true #TODO ALLOW ONLY NEWEST TLS TRANSPORT
}


module "www_website_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket_prefix = "www"
  acl           = "private"
  force_destroy = true

  website = {
    redirect_all_requests_to = {
      host_name = module.website_bucket.s3_bucket_bucket_regional_domain_name
    }
  }

  attach_policy = true
  policy = data.aws_iam_policy_document.static_website_policy.json
}


module "website_bucket" {

  force_destroy = true
  source = "terraform-aws-modules/s3-bucket/aws"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  attach_policy = true
  policy = data.aws_iam_policy_document.static_website_policy.json

  acl = "private"

  versioning = {
    status     = true
    mfa_delete = false
  }

  logging = {
    target_bucket = module.log_bucket.s3_bucket_id
    target_prefix = "log/"
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
}

#Upload files of your static website
resource "aws_s3_object" "data" {
  for_each = { for file in local.file_with_type : "${file.file_name}.${file.mime}" => file }

  bucket = module.website_bucket.s3_bucket_id
  key    = each.value.file_name

  source       = local.static_resource_paths[each.value.file_name]
  etag         = filemd5(local.static_resource_paths[each.value.file_name])
  content_type = each.value.mime
}
