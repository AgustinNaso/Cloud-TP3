resource "random_pet" "this" {
  length = 4
}

locals {
  bucket_name      = "static-website-${random_pet.this.id}"
  static_resources = "../frontend"
  website_domain   = var.website_domain
  path             = "../resources"

  lambdas = {
    "test" = {
      filename      = "${local.path}/lambdas/lambda_test.zip"
      function_name = "test"
      method        = "GET"
      handler       = "lambda_test.main"
      path          = "test"
    }
  }
}