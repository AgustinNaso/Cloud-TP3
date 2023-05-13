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

//Aca conecto al api gw con la lambda
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.api_gw_id
  resource_id             = aws_api_gateway_resource.this.id
  http_method             = aws_api_gateway_method.this.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = module.lambda.invoke_arn
}

resource "aws_lambda_permission" "api_gw_lambda" {
    statement_id = "AllowExecutionAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = var.lambda_info.function_name
    principal     = "apigateway.amazonaws.com"
    source_arn = "arn:aws:execute-api:${var.region}:${var.api_gw_id}/*/${var.lambda_info.method}${aws_api_gateway_resource.this.path}"
}
