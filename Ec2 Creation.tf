provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"     #Replace the access key created on AWS Account
  secret_key = "my-secret-key"     #Add the secret key created on AWS Account
  version    = "2.7"
}

resource "aws_instance" "ec2test" {
  ami = "ami_id"  #Replace ami_id with the id from AWS AMI , it's different from region to region
  instance_type = "t2.medium"   #num of Vcpus , Memory , storage , etc,,

  #on CLI "command prompt" run #terraform init  : it download plugin associated with the provider : aws
  # Run #terraform plan  : it read terraform file and show things that will created
  #Run #terraform apply "to start creation"     #Result : instance created on AWS account
}
