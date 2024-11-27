# AWS_Terraform2

1)VPC with multiple subnets (public and private).
2)Auto Scaling Group (ASG) for EC2 instances in private subnets.
3)Application Load Balancer (ALB) in public subnets.
4)NAT Gateways for internet access from private subnets.
5)Routing tables and advanced configurations.
##
# Features

VPC with subnets:
2 public subnets and 2 private subnets.
NAT Gateway for private subnet internet access.
ALB distributing traffic to EC2 instances.
Auto Scaling Group with a launch template for dynamic scaling.
Secure Network Design:
Separate security groups for the ALB and EC2 instances.

# Installation steps
terraform init
terraform validate
terraform paln
terraform apply
