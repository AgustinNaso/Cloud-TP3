variable "vpc_name" {
  description  = "Name tag value"
  type         = string
  default      = "MainVPC-G3"
}

variable "cidr_block" {
  description  = "CIDR block for the main vpc"
  type         = string 
  default     = "10.0.0.0/16"
}

variable "zones_qty" {
  description = "Quantity of zones"
  type        = number
  default     = 2
}
