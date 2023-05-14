terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"

    }
    archive = {
      source = "hashicorp/archive"
      version = "2.3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }


  }

  required_version = ">= 1.4.0"
}