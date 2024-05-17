terraform {
  source = "git@github.com:msanavia/iac.git//modules/github"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  github_owner = "msanavia"
  github_repositories = {
    advent-of-code = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      dependabot_enable      = true
      description            = "Advent of Code solutions."
      topics                 = ["advent-of-code", "python"]
      visibility             = "public"
    }
    entra-id-memberships-cloner = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      dependabot_enable      = true
      description            = "Shell script to clone memberships between 2 users or 2 groups"
      topics                 = ["entra-id", "shell"]
      visibility             = "public"
    }
    iac = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      dependabot_enable      = true
      description            = "Monorepo for Infrastructure as Code."
      topics                 = ["terraform", "terragrunt", "github", "cicd"]
      visibility             = "public"
    }
    learning-and-development = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "Labs for training."
      visibility             = "private"
    }
    msanavia = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "GitHub Personal Profile"
      visibility             = "public"
    }
    react-app-cicd = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "Production-Grade workflow with CICD deployment."
      topics                 = ["react", "cicd", "github-actions", "travisci", "travisci", "aws-eb"]
      visibility             = "public"
    }
    "setlist.fm-bot" = {
      archive_on_destroy     = true
      delete_branch_on_merge = true
      description            = "Python script that will predict an artist's setlist  for a given tour based on past setlist of the same tour."
      topics                 = ["python", "http"]
      visibility             = "private"
    }
  }
}
