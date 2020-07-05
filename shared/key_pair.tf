resource "aws_key_pair" "kabocha_common" {
  key_name   = "kabocha_common"
  public_key = file("./file/id_rsa.pub")
}

output "key_pair_common" {
  value = aws_key_pair.kabocha_common
}