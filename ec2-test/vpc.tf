module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.128.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  private_subnets = ["10.128.129.0/24", "10.128.130.0/24", "10.128.131.0/24"]
  public_subnets  = ["10.128.1.0/24", "10.128.2.0/24", "10.128.3.0/24"]

  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_nat_gateway   = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
