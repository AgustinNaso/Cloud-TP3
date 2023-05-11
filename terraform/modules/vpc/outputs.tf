output "vpc_cidr" {
    description = "VPC CIDR block"
    value = aws_vpc.main_vpc.cidr_block
}

output "private_subnets_ids" {
  value = [
    for k, v in aws_subnet.private_subnet : v.id
  ]
}