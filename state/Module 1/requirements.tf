/*
  requirements.tf defines what this (root) module needs by
  defining a terraform settings block.

  This is where we define required providers,
  set version constaints on both providers and terraform itself,
  and various other configurations.

  See: https://developer.hashicorp.com/terraform/language/settings
*/
terraform {
  required_providers {
    hashicups = {
      source = "hashicorp.com/edu/hashicups"
    }
  }
}
