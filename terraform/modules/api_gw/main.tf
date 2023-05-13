resource "aws_api_gateway_rest_api" "this" {

  name = "G3-API"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  //La idea de esto es q cuando cambia una lambda se redeploye el api gw
  # triggers = {
  #   //en vez de {} poner hash de las lambda
  #   redeployment = sha1(jsonencode("{}"))
  # }

  depends_on = [  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "this" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = "api"
}
