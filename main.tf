resource "aws_instance" "ap" {
  ami                         = "ami-0e820afa569e84cc1"
  instance_type               = "t2.micro"
  key_name                    = "developer"
  associate_public_ip_address = true
  tags = {
    Name = "Web"
  }

 # remote-exec
    provisioner "remote-exec" {
      inline = [
        "sudo touch test123",
        " sudo echo testhe ji >test123",
        " sudo yum install -y httpd",
      ]
    }

       connection {
      host        = self.public_ip # or we can also use  aws_instance.ap.public_ip
      type        = "ssh"          # winrm
      user        = "ec2-user"
      private_key = file("/developer") # "./developer"
      timeout     = "4m"
    }

    provisioner "local-exec" {
    command = "touch test100"
  }
  }

   

# Key pair

resource "aws_key_pair" "key1" {
  key_name   = "developer"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0471hU9uQOJ5S0KZFsErKBgrOB4bnsK2YLFLTaxhjlzXPtP+kEgLkbMlXZ9mu66fR3tcyNvJRDHMnZGT1yMcxw9OxFhb6FAqq28+nmfhkI711boo8sz8ITPLKIYZYHGpBwvwUh1qMpDblUucSMdOx9yjUsnKt0Zjp42TWPKWKyADcFKVh/PdY5ogmhxjDJnFicHwFIO2BHuTUO7BxZJEt+Zk7lrBU8tJfBt7khagiGyBcNVlgZaMwCR3tSwDCkzvjcWbMuHLMUX2zuzRSZXZOeG0FnB2dz7WT02xO52SFacGSRCp2kbXKUXl07mciQt5nv4gPPUClK1UVFSlHXtQAx7l8lA/bLfGpIBZydqSo9XkezZ/wck67LAL5+k23Hy5eUSsvlZevmrPChXCFCRbV3e7vdFH+XXfHuDnId64crI1xyF/JwIjLvLhryJoJEEz8WjkA2TiTy7GIqX4un4O4UrcdXZg6ATWyLp1movYGcFXNMgvJz3SLtdX7MLOv5g0= GMX+004HUI744@LAPTOP-D42KL2M0"

}