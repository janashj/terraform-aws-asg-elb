# Creating ELB for ASG and infrastructure
resource "aws_elb" "bar" {
  name               = "foobar-terraform-elbs"
  availability_zones = data.aws_availability_zones.all.names
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    Name = "foobar-terraform-elbs"
  }
}
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
    autoscaling_group_name = aws_autoscaling_group.example_lt.id
    elb = aws_elb.bar.id
}