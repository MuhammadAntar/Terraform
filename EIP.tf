provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"     #Replace the access key created on AWS Account
  secret_key = "my-secret-key"     #Add the secret key created on AWS Account
  version    = "2.7"
}

resource "aws_eip" "ip" {
  vpc = true
}

output "eip" {
  value = aws_eip.ip.public_ip             #value will be replaced from AWS & public_ip is the attribute associated
}

resource "aws_s3_bucket" "s3test" {
  bucket = "bucket_name"
}
output "s3testbucket" {
  value = aws_s3_bucket.s3test.bucket_domain_name  #value will be replaced from AWS & bucket_domain_name is the attribute
}
