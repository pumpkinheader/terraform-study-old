data "terraform_remote_state" "shared" {
  backend = "s3"

  config = {
    bucket  = "terraform-study-tfstate"
    key     = "shared/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "kabocha-full"
  }
}