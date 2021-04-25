module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  name                   = "my-cluster"
  instance_count         = 1
  ami                    = "ami-0518bb0e75d3619ca"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  subnet_id              = "subnet-1bf8c541"
}

variable "instance_type" {
  type = map
  default = {
    default = "t2.micro"
    dev = "t2.small"
    prd = "t2.large"
  }
}
