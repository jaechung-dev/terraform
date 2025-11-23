variable "name" {
  description = "Base name prefix (e.g. payload)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where SGs will live"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}