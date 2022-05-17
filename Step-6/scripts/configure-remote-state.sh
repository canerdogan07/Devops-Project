#!/bin/bash
printf 'terraform {
  backend "s3" {
    bucket = "canerdogan-devops-project"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
' > backend.tf
