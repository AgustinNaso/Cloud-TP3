resource "aws_vpc" "main_vpc" {
    cidr_block = var.cidr_block

    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.0.0/24"

  tags = {
      Name = var.main_subnet_name
  }
}


resource "aws_subnet" "secondary_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.0.1.0/24"

  tags = {
      Name = var.secondary_subnet_name
  }
}