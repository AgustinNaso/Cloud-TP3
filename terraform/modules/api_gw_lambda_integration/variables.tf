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