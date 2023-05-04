variable "vpc_name" {
  description  = "Name tag value"
  type         = string
  default      = "MainVPC"
}

variable "cidr_block" {
  description  = "CIDR block for the main vpc"
  type         = string 
}

variable "zones_qty" {
  description = "Quantity of zones"
  type        = number
  default     = 2
}
