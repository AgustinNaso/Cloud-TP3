resource "random_pet" "this" {
  length = 4
}

locals {
  bucket_name = "static-website-${random_pet.this.id}"
  static_resources = "../frontend"
}