provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"     #Replace the access key created on AWS Account
  secret_key = "my-secret-key"     #Add the secret key created on AWS Account
  version    = "2.7"
}

resource "aws_instance" "ec2test" {
  ami = "ami_id"  #Replace ami_id with the id from AWS AMI , it's different from region to region
  instance_type = "t2.medium"   #num of Vcpus , Memory , storage , etc,,
}

resource "aws_eip" "ip" {
    vpc = true
  }

resource "aws_eip_association" "eip_assoc" {
    instance_id   = aws_instance.ec2test.id     #replace with instace_name and ID
    allocation_id = aws_eip.ip.id       #refer to which ip will be associated with the instance
  }

resource "aws_security_group" "allow_tls" {
    name        = "sgtest"


    ingress {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = [aws_eip.ip_public_ip/32]     #replace eip & public_ip
    }
  }
