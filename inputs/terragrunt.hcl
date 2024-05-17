remote_state {
  backend = "gcs"
  config = {
    bucket = "terraform-states-msanavia"
    prefix = "iac/inputs/${path_relative_to_include()}/"

  }
}

locals {
  providers = try(yamldecode(file("${get_original_terragrunt_dir()}/providers.yaml")), [])
}

generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "gcs" {}

  required_providers {
    %{if contains(local.providers, "github")}
      github = {
        source  = "integrations/github"
        version = "~> 6.0"
    }
    %{endif}
  }
}
EOF
}
