variable "vpc_name" {
  description  = "Name tag value"
  type         = string
  default      = "MainVPC"
}

variable "cidr_block" {
  description  = "CIDR block for the main vpc"
  type         = string 
}

variable "main_subnet_name" {
  description  = "Name tag value for main subnet"
  type         = string
  default      = "MainSubnet"
}

variable "secondary_subnet_name" {
  description  = "Name tag value for secondary subnet"
  type         = string
  default      = "SecondarySubnet"
}
