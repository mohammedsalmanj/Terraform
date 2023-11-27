variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0230bd60aa48260c6"
    us-east-2 = "ami-0fa1ca9559f1892ec"
  }
}

variable "USER" {
  default = "ec2-user"
}
