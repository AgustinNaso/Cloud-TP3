output "vpc_cidr" {
    description = "VPC CIDR block"
    value = aws_vpc.main_vpc.cidr_block
}