region      = "ap-southeast-2"
project_name = "payload"
environment  = "dev"

vpc_cidr = "10.0.0.0/16"

azs = [
  "ap-southeast-2a",
  "ap-southeast-2b",
]

public_subnet_cidrs = [
  "10.0.0.0/24",
  "10.0.1.0/24",
]

private_subnet_cidrs = [
  "10.0.10.0/24",
  "10.0.11.0/24",
]

enable_nat_gateway = true

image_url  = "757953088569.dkr.ecr.ap-southeast-2.amazonaws.com/payload-dev:latest"

github_org  = "jaechung-dev"
github_repo = "terraform"