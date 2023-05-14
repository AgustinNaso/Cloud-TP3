locals {
  path          = "../resources/lambdas/"
  file_name     = "${local.path}${var.function_name}.py"
  zip_file_name = "${local.path}${var.function_name}.zip"
  handler       = "${var.function_name}.main"
}