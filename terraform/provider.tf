terraform {
  required_version = ">= 1.1.2"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.7.1"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
  }
}