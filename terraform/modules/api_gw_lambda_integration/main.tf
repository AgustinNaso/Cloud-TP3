module "lambda" {
    source = "../lambda"
    lambda_info = var.lambda_info
    subnet_ids = var.subnet_ids
    account_id = var.account_id
}


resource "aws_api_gateway_resource" "this" {
  rest_api_id = var.api_gw_id
  parent_id   = var.api_gw_resource_id
  path_part   = var.lambda_info.path 
}

resource "aws_api_gateway_method" "this" {
  rest_api_id   = var.api_gw_id
  resource_id   = aws_api_gateway_resource.this.id
  http_method   = var.lambda_info.method
  authorization = "NONE"
}


# PATH /path 200 RESPONSE
resource "aws_api_gateway_method_response" "this" {
  rest_api_id = var.api_gw_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = "200"
}

//Aca conecto al api gw con la lambda
resource "aws_api_gateway_integration" "this" {
  rest_api_id             = var.api_gw_id
  resource_id             = aws_api_gateway_resource.this.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.lambda.invoke_arn
}

# PATH /path - GET method - 200 RESPONSE INTEGRATION
resource "aws_api_gateway_integration_response" "this" {
  rest_api_id = var.api_gw_id
  resource_id = aws_api_gateway_resource.this.id
  http_method = aws_api_gateway_method.this.http_method
  status_code = aws_api_gateway_method_response.this.status_code

  depends_on = [
    aws_api_gateway_integration.this
  ]
}


resource "aws_lambda_permission" "api_gw_lambda" {
    statement_id  = "AllowExecutionFromAPIGateway"
    action        = "lambda:InvokeFunction"
    function_name = var.lambda_info.function_name
    principal     = "apigateway.amazonaws.com"
    source_arn    = "${var.execution_arn}/*/${aws_api_gateway_method.this.http_method}${aws_api_gateway_resource.this.path}"
    # source_arn = "arn:aws:execute-api:${var.region}:${var.api_gw_id}/*/${var.lambda_info.method}$
    # {aws_api_gateway_resource.this.path}"

      depends_on = [
    module.lambda
  ]
}
