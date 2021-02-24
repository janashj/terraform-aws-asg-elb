# Creating ASG with Launch Template. 
# Launch template can be versioned and no need to create every time
resource "aws_autoscaling_group" "example_lt" {
  availability_zones = data.aws_availability_zones.all.names
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.launch_template.id
      }
      override {
        instance_type     = "c4.large"
        weighted_capacity = "3"
      }
      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }
    }
  }
  tags = [{
    "Name" = "my_ASG"
  }]
}
