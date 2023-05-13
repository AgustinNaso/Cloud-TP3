variable "account_id" {
  type        = string
  description = "Current account ID"
}

variable "lambda_info" {
  type        = map(string)
  description = "Contains all info of a lambda"
}

variable "subnet_ids" {
  type        = list(any)
  description = "List of subnets created"
}