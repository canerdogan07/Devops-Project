resource "aws_launch_configuration" "launchconfig" {
  name_prefix     = "example-launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.allow-ssh.id]
  user_data = file("stress_app.sh")
}

resource "aws_autoscaling_group" "autoscaling" {
  name                      = "example-autoscaling"
  vpc_zone_identifier       = [aws_subnet.public-1.id, aws_subnet.public-2.id]
  launch_configuration      = aws_launch_configuration.launchconfig.name
  min_size                  = 1
  max_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

