resource "aws_key_pair" "terra" {
  key_name   = "terrakey"
  public_key = file("terrakey.pub")
}

resource "aws_instance" "terra-ins" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra.key_name
  vpc_security_group_ids = ["sg-05524165a697a787b"]

  tags = {
    Name    = "terrawow"
    project = "maxx"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh",
    ]
  }

  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("terrakey")
    host        = self.public_ip
  }
}


output "public_ip" {
  value = aws_instance.terra-ins.public_ip  
}

output "private_ip" {
  value = aws_instance.terra-ins.private_ip 
}