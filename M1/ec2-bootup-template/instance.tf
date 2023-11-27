resource "aws_instance" "wow" {
    ami = var.AMIS[var.REGION]
    instance_type = "t2.micro"
    availability_zone = var.ZONE1
    key_name = "terrakey"
    vpc_security_group_ids = ["sg-05524165a697a787b"]
    tags = {
      Name    = "terrawow"
      project = "maxx"
  }
}