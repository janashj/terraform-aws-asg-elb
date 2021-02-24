# Terraform-14
This repo is build for AWS ASG with ELB and Launch Template.

### Requirements:
# Please use terraform 0.14.7 or above

# Please copy paste below code to module, so that it can be deployed with asg_with_lt 

'''

module "wordpress" {
  ssh_cidr_blocks = [
    "127.0.0.1/32",
    "0.0.0.0/0"
  ]
  app_name         = "wordpress"
  source           = "janashj/aws/asg-elb"
  aws_region       = "us-east-1"
  desired_capacity = 1
  max_size         = 99
  min_size         = 1
  key_name         = "wordpress_key"
  key_location     = "~/.ssh/id_rsa.pub"
}

'''

# Please run
terraform init
terraform apply

'''
