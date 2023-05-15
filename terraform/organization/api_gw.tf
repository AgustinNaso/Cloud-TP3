module "api_gw" {
    source = "../modules/api_gw"
}

module "lambda" {
    for_each = local.lambdas
    source   = "../modules/api_gw_lambda_integration"

    account_id           = data.aws_caller_identity.this.account_id
    api_gw_execution_arn = module.api_gw.execution_arn
    api_gw_id            = module.api_gw.id
    api_gw_resource_id   = module.api_gw.resource_id
    lambda_info          = each.value
    security_groups      = [aws_security_group.this["lambda"].id]
    subnet_ids           = module.vpc.private_subnets_ids
}