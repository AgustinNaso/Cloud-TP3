#TODO ESTA BIEN QUE ESTE MODULO SE LLAME LAMBDA?
data "archive_file" "this" {
  type        = "zip"
  source_file = local.file_name
  output_path = local.zip_file_name
}

resource "aws_lambda_function" "this" {
  filename      = local.zip_file_name
  function_name = var.function_name
  role          = "arn:aws:iam::${var.account_id}:role/LabRole"
  #function that handles the event
  handler       = local.handler
  runtime       = var.runtime

  tags = {
    name = "Lambda ${var.function_name}"
  }

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_groups
  }

  depends_on = [
    data.archive_file.this
  ]
}