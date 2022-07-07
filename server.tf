provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  key_name = "raman-import"

  tags = {
    Name = "Raman-DevOps-Synechron-batch-server"
    env = "development"
    owner = "Raman Khanna"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

