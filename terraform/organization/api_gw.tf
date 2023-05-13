module "api_gateway" {
    source = "../modules/api_gw"
}

module "lambda" {
    for_each = local.lambdas
    source ="../modules/api_gw_lambda_integration"
    api_gw_id = module.api_gateway.id
    api_gw_resource_id = module.api_gateway.resource_id
    lambda_info = each.value

    subnet_ids = module.vpc.private_subnets_ids
    account_id = data.aws_caller_identity.current.account_id
}