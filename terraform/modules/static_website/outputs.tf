output "website_bucket_id" {
  description = "Website bucket id"
  value       = module.website_bucket.s3_bucket_id
}

output "website_bucket_domain_name" {
  description = "Website bucket id"
  value       = module.website_bucket.s3_bucket_bucket_domain_name
}


