# Launch Template for ASG
resource "aws_launch_template" "ec2" {
  name          = "app-launch-template"
  image_id      = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [aws_security_group.ec2.id]
  }

  tags = {
    Name = "App-Instance"
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = aws_subnet.private[*].id
  launch_template {
    id      = aws_launch_template.ec2.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.target_group.arn]

  tags = [
    {
      key                 = "Name"
      value               = "App-Instance"
      propagate_at_launch = true
    }
  ]
}
