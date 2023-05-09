resource "random_pet" "this" {
  length = 4
}

locals {
  bucket_name = "static-website-${random_pet.this.id}"
}


module "site_bucket" {

  bucket = local.bucket_name
  source = "terraform-aws-modules/s3-bucket/aws"


  versioning = {
    status     = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}


resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = module.site_bucket.s3_bucket_id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#Upload files of your static website
resource "aws_s3_object" "data" {
  for_each = { for file in local.file_with_type : "${file.file_name}.${file.mime}" => file }

  bucket = module.site_bucket.s3_bucket_id
  key    = each.value.file_name

  source       = "${var.src}/${each.value.file_name}"
  etag         = filemd5("${var.src}/${each.value.file_name}")
  content_type = each.value.mime
}
