# for tfstate-file
resource "aws_s3_bucket" "s3-bucket-tfstate" {
  bucket = "terraform-study-tfstate"
  acl    = "private"
}