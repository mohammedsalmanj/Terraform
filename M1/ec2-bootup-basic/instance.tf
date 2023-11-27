provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_instance" "new" {
  ami               = "ami-0230bd60aa48260c6"
  instance_type     = "t2.micro" # Instance type
  availability_zone = "us-east-1a"
  key_name          = "terrakey" # Replace with your key pair name

  vpc_security_group_ids = ["sg-05524165a697a787b"] # Replace with your security group ID

  tags = {
    Name    = "terrawow"
    project = "maxx"
  }
}
