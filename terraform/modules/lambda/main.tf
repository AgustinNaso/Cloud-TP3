resource "aws_lambda_function" "this" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  # filename is a .zip
  filename      = var.lambda_info.filename
  function_name = var.lambda_info.function_name
  role          = aws_iam_role.this.arn
  #function that handles the event
  handler       = var.lambda_info.handler
  runtime       = "python3.9"

  tags = {
    name = "Lambda ${var.lambda_info.function_name}"
  }
}

# resource "aws_lambda_permission" "lambda_permission" {
#   statement_id  = "AllowExecutionFromAPIGateway"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.this.function_name
#   principal     = "apigateway.amazonaws.com"

#   # The /* part allows invocation from any stage, method and resource path
#   # within API Gateway.
#   source_arn = "${var.api_gateway_execution_arn}/*/${var.lambda_info.method}${var.lambda_info.path}"
# }