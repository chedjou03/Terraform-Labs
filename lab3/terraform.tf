terraform {
  required_version = ">= 1.0.0"

  #******* local backend State File ********
  # backend "local" {
  #   path = "terraform.tfstate"
  # }

  #******* S3 backend State File ********
  # backend "s3" {
  #   bucket = "my-terraform-state-simplicechedjou"
  #   key    = "prod/aws_infrastructure"
  #   region = "us-east-1"
  # }

   #******* Terraform cloud  backend State File ********
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Simplice-ORG"
    workspaces {
      name = "my-aws-app"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}