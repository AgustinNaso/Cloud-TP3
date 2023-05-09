resource "aws_vpc" "main_vpc" {
    cidr_block = var.cidr_block
    enable_dns_support   = "true" 
    enable_dns_hostnames = "true" 

    tags = {
        Name = var.vpc_name
    }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  count             = var.zones_qty
  cidr_block        = cidrsubnet(aws_vpc.main_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]


  tags = {
      Name = "private_subnet_${count.index}"
  }
}
