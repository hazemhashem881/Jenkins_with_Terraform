resource "aws_instance" "agent" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.network.public2_subnet_id
  key_name = "ec2"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  user_data     =file("install_docker.sh")
  tags = {
    Name ="agent-EC2"
  }
  root_block_device {
    delete_on_termination = true
  }

}
# -------------- connect ec2

# an empty resource block

resource "null_resource" "ssh-agent" {

  #ssh into ec2 instance
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Desktop/ec2.pem")
    host = aws_instance.agent.public_ip
  }
  

  #copy the install_docker.sh file from your computer to ec2 instance
  provisioner "file"{
    source = "install_docker.sh"
    destination = "/tmp/install_docker.sh"
  }
# set permissions and run the install_jenkins.sh file
provisioner "remote-exec" {
  inline = [
    "sudo chmod +x /tmp/install_docker.sh",
    "sh /tmp/install_docker.sh",
  ]
}

  
# set permissions and run the install_jenkins.sh file
provisioner "remote-exec" {
  inline = [
    "sudo apt update",
    "sudo mkdir /home/ubuntu/jenkins_home",
    "sudo mkdir /home/ubuntu/jenkins_home",
    "sudo chmod 0777 /home/ubuntu/jenkins_home ",
    "cd /home/ubuntu/jenkins_home",
    "sudo apt install openjdk-11-jdk -y ",
  ]
}
# wait for ec2 to be create

depends_on = [aws_instance.agent]

}


resource "aws_instance" "pubEC2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id = module.network.public1_subnet_id
  key_name = "ec2"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.SG-1.id]
  user_data     =file("install_jenkins.sh")
  tags = {
    Name ="master-EC2"
  }
  root_block_device {
    delete_on_termination = true
  }
  

}
# -------------- connect ec2

# an empty resource block

resource "null_resource" "name" {

  #ssh into ec2 instance
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/Desktop/ec2.pem")
    host = aws_instance.pubEC2.public_ip
  }
  

  #copy the install_jenkins.sh file from your computer to ec2 instance
  provisioner "file"{
    source = "install_jenkins.sh"
    destination = "/tmp/install_jenkins.sh"
  }


# set permissions and run the install_jenkins.sh file
provisioner "remote-exec" {
  inline = [
    "sudo chmod +x /tmp/install_jenkins.sh",
    "sh /tmp/install_jenkins.sh",
  ]
}
# wait for ec2 to be create

depends_on = [aws_instance.pubEC2]

}


