output "domain_name" {
  description = "Bucket domain name"
  value       = module.website_bucket.s3_bucket_bucket_domain_name
}

output "website_bucket_id" {
  description = "Website bucket id"
  value       = module.website_bucket.s3_bucket_id
}
