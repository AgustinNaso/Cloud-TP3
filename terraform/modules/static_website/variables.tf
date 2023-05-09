variable "static_resources" {
    description = "Path to the static resources of the website"
    type        =  string
}

variable "bucket_name" {
  description  = "The bucket domain name"
  type         = string
}

variable "bucket_prefix" {
  description  = "The bucket prefix"
  type         = string
  default = "G3"
}

variable "bucket_access_OAI" {
  description  = "OAI of authorized bucket users"
  type         = list(string)
}