module "api_gw" {
    source = "../modules/api_gw"
    aws_region = var.aws_region
}

module "lambda" {
    for_each = local.lambdas
    source ="../modules/api_gw_lambda_integration"
    api_gw_id = module.api_gw.id
    api_gw_resource_id = module.api_gw.resource_id
    lambda_info = each.value
    execution_arn = module.api_gw.execution_arn

    subnet_ids = module.vpc.private_subnets_ids
    account_id = data.aws_caller_identity.current.account_id
}