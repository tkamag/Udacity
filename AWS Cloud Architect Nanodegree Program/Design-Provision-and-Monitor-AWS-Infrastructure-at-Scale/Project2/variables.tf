# TODO: Define the variable for aws_region

variable "awsprops" {
    type                    = map
    default                 = {
        aws_region              = "us-east-1"
        ami                     = "ami-0b0dcb5067f052a63"
        type                    = "t2.micro"
        publicip                = true
        keyname                 = "myseckey"
        source_file             = "greet_lambda.py"
        output_path             = "greet_lambda.zip"
        lambda_function_name    = "udacity_lambda"
        runtime                 = "python3.8"
        greeting                = "Hello everyone!"
        retention_in_days       = 14
        runtime                 = "python3.8"
                }
        }