# module "lambda" {
#   for_each = local.lambdas

#   source              = "../modules/lambda"
#   #local_path          = local.path
#   lambda_info         = each.value
#   account_id          = data.aws_caller_identity.current.account_id
#   # apigw_execution_arn = module.apigw.execution_arn
#   subnet_ids          = module.vpc.private_subnets_ids
#   #sg_ids              = [aws_security_group.this.id]
# }


#TODO ESTO VUELA?