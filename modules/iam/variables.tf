variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "github_org" {
  description = "GitHub org/user name (owner of repo)"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "task_execution_role_arn" {
  description = "ECS task execution role ARN that GitHub Actions may pass"
  type        = string
}