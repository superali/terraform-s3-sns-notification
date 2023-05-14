terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }

  }

  required_version = ">= 1.4.6"
}