module "wordpress" {
  ssh_cidr_blocks = [
    "127.0.0.1/32",
    "0.0.0.0/0"
  ]
  app_name         = "wordpress"
  source           = "/home/ec2-user/Terraform-14/iclass_4_tasks/asg_with_lt"
  aws_region       = "us-east-1"
  desired_capacity = 1
  max_size         = 99
  min_size         = 1
  key_name         = "wordpress_key"
  key_location     = "~/.ssh/id_rsa.pub"

}


