output "cluster_name" {
  value       = aws_ecs_cluster.this.name
  description = "ECS cluster name"
}

output "service_name" {
  value       = aws_ecs_service.app.name
  description = "ECS service name"
}

output "task_definition_arn" {
  value       = aws_ecs_task_definition.app.arn
  description = "Task definition ARN"
}

output "task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = aws_iam_role.task_execution.arn
}