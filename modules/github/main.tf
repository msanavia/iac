resource "github_repository" "repository" {
  for_each             = var.github_repositories
  name                 = each.key
  description          = each.value.description
  visibility           = each.value.visibility
  auto_init            = true
  topics               = each.value.topics
  vulnerability_alerts = true

}
resource "github_repository_dependabot_security_updates" "dependabot" {
  for_each   = local.dependabot_enabled
  repository = github_repository.repository[each.key].id
  enabled    = true
}
resource "github_branch_protection" "main_branch_protection" {
  for_each                        = local.public_repositories
  repository_id                   = github_repository.repository[each.key].id
  pattern                         = "main"
  lock_branch                     = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
  }
}
