##############################################
# ALB Module Variables
##############################################

variable "name" {
  description = "Base name prefix for ALB resources (e.g. payload)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB and target group live"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID to attach to the ALB"
  type        = string
}

variable "listener_port" {
  description = "ALB listener port"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "ALB listener protocol"
  type        = string
  default     = "HTTP"
}

variable "target_port" {
  description = "Port on which ECS tasks receive traffic"
  type        = number
  default     = 80
}

variable "target_protocol" {
  description = "Protocol for target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Health check path for target group"
  type        = string
  default     = "/health.html"
}

variable "tags" {
  description = "Common tags to apply"
  type        = map(string)
  default     = {}
}