# TODO: Designate a cloud provider, region, and credentials


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2


# TODO: provision 2 m4.large EC2 instances named Udacity M4

provider "aws" {
    access_key =  ""
    secret_key =  ""
    region = "us-east-1"
}

resource "aws_instance" "Udacity_T2_Nonodegree" {
    count         = "4"
    ami           = "ami-0b0dcb5067f052a63"
    instance_type = "t2.micro"
    tags          = {
                    Name = "Udacity T2 - Nonodegree"
                }
}

resource "aws_instance" "Udacity_M4_Nonodegree" {
    count         = "2"
    ami           = "ami-0b0dcb5067f052a63"
    instance_type = "m4.large"
    tags          = {
                    Name = "Udacity M4 - Nonodegree"
                }
}
