terraform {
  backend "s3" {
    bucket  = "terraform-study-tfstate"
    key     = "user-data-test/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kabocha-full"
  }
}

provider "aws" {
  profile = "kabocha-full"
  region  = "ap-northeast-1"
}