terraform {
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.40.0" #TODO ACA HAY QUE USAR ALGUNA VERSION ESPECIFICA??
    }
  }
}

resource "random_pet" "this" {
  length = 4
}
