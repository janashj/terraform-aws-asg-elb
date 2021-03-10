# terraform-aws-asg-elb
This repo is build for AWS ASG with ELB and Launch Template.

### Requirements:
### Please use terraform 0.14.7 or above

### Please copy paste below code to module.tf file 

```

module "aws-asg" {
  source           = "github.com/janashj/terraform-aws-asg-elb"
  app_name         = "wordpress"
  aws_region       = "us-east-1"
  desired_capacity = 1
  max_size         = 99
  min_size         = 1
  key_name         = "asg_ssh_key"
  key_location     = "~/.ssh/id_rsa.pub"
  ssh_cidr_blocks = [
    "127.0.0.1/32",
    "0.0.0.0/0"
  ]
 
}

```

# Please run
terraform init

terraform apply

```
