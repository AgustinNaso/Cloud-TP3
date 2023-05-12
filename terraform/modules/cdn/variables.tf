variable "ipv6_enable" {
  description  = "Enable IPV6 CDN support"
  type         = bool
  default      = false
}

variable "aliases" {
  description  = "CDN aliases"
  type         = set(string)
}

variable "domain_name" {
  description  = "Domain name"
  type         = string
}

variable "bucket_domain_name" {
  description  = "Domain name"
  type         = string
}

variable "bucket_origin_id" {
  description  = "CDN origin bucket id"
  type         = string
}

variable "certificate_arn" {
  description  = "Certificate ARN"
  type         = string
}