resource "aws_instance" "docker_host" {

    depends_on = [aws_security_group.docker_vpc_sg]
    ami = data.aws_ami.amz_lnx2_ami.id              
    instance_type = "t2.micro"
    key_name = "Linux_serverKeypair"
    vpc_security_group_ids = [aws_security_group.docker_vpc_sg.id]
    root_block_device {
      volume_type = "gp3"
      volume_size =  10
    }
    user_data = file("userdata_1.sh")
    

}

resource "aws_security_group" "docker_vpc_sg"{
    name = "docker_vpc_sg_name"
  vpc_id = data.aws_vpc.vpc_id.id
}
resource "aws_security_group_rule" "ssh_sg_ingress_rule" {

    type = "ingress"
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.docker_vpc_sg.id
  }

resource "aws_security_group_rule" "jenkin_sg_ingress_rule" {

    type = "ingress"
    description = "Allow Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.docker_vpc_sg.id
  }
  

  resource "aws_security_group_rule" "sg_egress_rule" {

    type = "egress"
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.docker_vpc_sg.id
  }
 
