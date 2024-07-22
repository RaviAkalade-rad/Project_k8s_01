data "aws_ami" "amz_lnx2_ami"{

    most_recent = true
    owners = ["amazon"]
    filter {
      name ="name"
      values = ["amzn2-ami-kernel*x86_64-gp2"]
    }      
    }

data "aws_vpc" "vpc_id" {
        default =true
        
  /*filter {
        name = "default"
        values = [true]
  }*/
}