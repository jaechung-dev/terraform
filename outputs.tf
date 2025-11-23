output "ecr_repository_url" {
  description = "ECR repository URL for this app"
  value       = module.ecr.repository_url
}