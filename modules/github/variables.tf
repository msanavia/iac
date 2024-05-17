variable "github_owner" {
  description = "GitHub account to manage."
  type        = string
}
variable "github_repositories" {
  description = "A map of repositories."
  type = map(object({
    archive_on_destroy     = bool
    delete_branch_on_merge = bool
    dependabot_enable      = optional(bool)
    description            = string
    visibility             = string
    topics                 = optional(list(string), null)
  }))
}
