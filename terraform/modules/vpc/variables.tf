variable "vpc_name" {
  description  = "Name tag value"
  type         = string
  default      = "Main-VPC-G3"
}

variable "vpc_network_cidr" {
  description  = "CIDR block for the main vpc"
  type         = string 
  default     = "10.0.0.0/16"
}

variable "vpc_az_count" {
  description = "Quantity of zones"
  type        = number
  default     = 2
}
