terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# --- VPC module ---
module "vpc" {
  source = "./modules/vpc"

  name = var.project_name
  tags = { Project = var.project_name, Environment = var.environment }

  vpc_cidr = var.vpc_cidr
  azs      = var.azs

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  enable_nat_gateway = var.enable_nat_gateway
}

module "security" {
  source = "./modules/security"

  name   = var.project_name
  vpc_id = module.vpc.vpc_id
  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}

module "alb" {
  source = "./modules/alb"

  name              = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  tags              = local.common_tags
}

# --- ECS module ---
module "ecs" {
  source = "./modules/ecs"

  name        = var.project_name # "payload"
  environment = var.environment  # "dev"
  region      = var.region
  tags        = local.common_tags

  image_url      = var.image_url # set in dev.tfvars
  container_name = "payload-app"

  task_cpu      = 256
  task_memory   = 512
  desired_count = 1

  private_subnet_ids      = module.vpc.private_subnet_ids
  ecs_tasks_sg_id         = module.security.ecs_tasks_sg_id
  target_group_arn        = module.alb.target_group_arn
  alb_listener_depends_on = [module.alb.listener_arn]
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  environment  = var.environment
  tags         = local.common_tags
}

module "github_actions_iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

  github_org  = var.github_org
  github_repo = var.github_repo

  tags = local.common_tags
}