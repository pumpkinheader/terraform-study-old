variable allowed-cidr {
  default = null
}

module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "ssh"
  description = "Security group for EC2 via local pc"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = [local.allowed-cidr]

}

locals {
  current-ip   = chomp(data.http.ifconfig.body)
  allowed-cidr = (var.allowed-cidr == null) ? "${local.current-ip}/32" : var.allowed-cidr
}

data http ifconfig {
  url = "http://ipv4.icanhazip.com/"
}
