# Terraform Backend and Provider Configuration
terraform {
  cloud {
    organization = "medicalbrothers"  # Terraform Cloud organization name
    workspaces {
      name = "oracle_cloud"  # Terraform Cloud workspace name
    }
  }

  required_providers {
    oci = {
      source  = "oracle/oci"  # OCI provider source
      version = "~> 6.21.0"   # OCI provider version
    }
  }
}