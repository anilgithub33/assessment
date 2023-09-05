resource "aws_launch_configuration" "web_config" {
  name_prefix   = "nginx-"
  image_id      = var.ami_image
  instance_type = var.ec2_size

  user_data = <<-EOF
              #!/bin/bash
              yum install nginx -y
              echo 'Hello World' > /usr/share/nginx/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_config.name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = aws_subnet.public_subnet[*].id
  tag {
    key                 = "Name"
    value               = "webservers"
    propagate_at_launch = true
  }
}