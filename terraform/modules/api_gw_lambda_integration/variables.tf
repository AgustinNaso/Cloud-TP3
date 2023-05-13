variable "lambda_info" {
    description = "Map of all the info requider of the lambda function"
    type        = map(string)
}

variable "subnet_ids" {
  description = "Lambda VPC subnet ids"
  type        = list(string)
}

variable "account_id" {
    description = "Account id to be used for lambda function role"
    type        = string
}

variable "api_gw_id" {
  type = string
}

variable "api_gw_resource_id" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "execution_arn" {
  description = "API Gateway's execution ARN"
  type        = string
}