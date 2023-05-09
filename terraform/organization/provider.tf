
provider "aws" {
    alias = "aws" 

    region = var.aws_region
    shared_config_files     = ["~/.aws/config"]
    shared_credentials_files = ["~/.aws/credentials"]
    profile = "default"

    default_tags {
        tags = {
        author     = "Grupo 3"
        version    = 1
        university = "ITBA"
        subject    = "Cloud Computing"
        created-by = "terraform"
        }
    }
}