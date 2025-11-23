variable "name" {
  description = "Base app name (e.g. payload)"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/staging/prod)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}

variable "image_url" {
  description = "Full ECR image URL incl. tag"
  type        = string
}

variable "container_name" {
  description = "ECS container name"
  type        = string
  default     = "app"
}

variable "task_cpu" {
  description = "CPU units for Fargate task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory (MB) for Fargate task"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of running tasks"
  type        = number
  default     = 1
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for tasks"
  type        = list(string)
}

variable "ecs_tasks_sg_id" {
  description = "Security Group ID for ECS tasks"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "alb_listener_depends_on" {
  description = "Dummy string list for depends_on wiring (pass aws_lb_listener.http.arn)"
  type        = list(string)
}