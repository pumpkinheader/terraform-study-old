## simple user test
resource "aws_instance" "user-data-study" {
  ami                    = "ami-0a1c2ec61571737db"
  instance_type          = "t3.micro"
  key_name               = data.terraform_remote_state.shared.outputs.key_pair_common.id
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.web_server_sg.this_security_group_id]
  #   user_data     = "HelloWorld"
  user_data_base64 = "SGVsbG9Xb3JsZA=="

  associate_public_ip_address = "true"

  tags = {
    Name = "user-data-study"
  }
}

## asg user data test
module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"

  name = "user-data-study-by-asg"

  # Launch configuration
  lc_name = "user-data-test"

  image_id        = "ami-0a1c2ec61571737db"
  instance_type   = "t3.micro"
  security_groups = [module.web_server_sg.this_security_group_id]

  user_data = "HelloWorld"

  # Auto scaling group
  asg_name                  = "user-data-asg"
  vpc_zone_identifier       = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
  ]
}
