## Task 6: Destroy the Infrastructure using Terraform and prepare for submission

1. Destroy all running provisioned infrastructure using Terraform so as not to incur unwanted charges.

2. Take a screenshot of the EC2 instances page and label it ``Terraform_destroyed.png`` or ``Terraform_destroyed.jpg`` .

 <img width="100%" src="./fig/Terraform_destroyed.png">
<p style='text-align: center; margin-right: 3em; font-family: Serif;'><b> Secondary VPC subnet in North California </b></p>

````python

PS W:\MOOC\Udacity\AWS Cloud Architect Nanodegree Program\01 - Design For Performance And Scalability\06-Design, Provision and Monitor AWS Infrastructure at Scale\Part_2> terraform destroy
data.archive_file.zip: Reading...
data.archive_file.zip: Read complete after 1s [id=a068562b845d5c14c793ca0bb94c2f0764e5f651]
aws_iam_policy.lambda_logging: Refreshing state... [id=arn:aws:iam::883141128379:policy/lambda_logging]
aws_cloudwatch_log_group.example: Refreshing state... [id=/aws/lambda/udacity_lambda_function]
data.aws_iam_policy_document.policy: Reading...
data.aws_iam_policy_document.policy: Read complete after 0s [id=3693445097]
aws_iam_role.iam_for_lambda: Refreshing state... [id=iam_for_lambda]
aws_iam_role_policy_attachment.lambda_logs: Refreshing state... [id=iam_for_lambda-20221207163403033500000001]
aws_lambda_function.udacity_lambda_function: Refreshing state... [id=udacity_lambda]
aws_cloudwatch_event_rule.demo_lambda_every_one_minute: Refreshing state... [id=demo_lambda_every_one_minute]
aws_lambda_permission.demo_lambda_every_one_minute: Refreshing state... [id=AllowExecutionFromCloudWatch]
aws_cloudwatch_event_target.lambda_udacity: Refreshing state... [id=demo_lambda_every_one_minute-lambda_udacity]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_cloudwatch_event_rule.demo_lambda_every_one_minute will be destroyed
  - resource "aws_cloudwatch_event_rule" "demo_lambda_every_one_minute" {
      - arn                 = "arn:aws:events:us-east-1:883141128379:rule/demo_lambda_every_one_minute" -> null
      - event_bus_name      = "default" -> null
      - id                  = "demo_lambda_every_one_minute" -> null
      - is_enabled          = true -> null
      - name                = "demo_lambda_every_one_minute" -> null
      - schedule_expression = "rate(1 minute)" -> null
      - tags                = {} -> null
      - tags_all            = {} -> null
    }

  # aws_cloudwatch_event_target.lambda_udacity will be destroyed
  - resource "aws_cloudwatch_event_target" "lambda_udacity" {
      - arn            = "arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda" -> null
      - event_bus_name = "default" -> null
      - id             = "demo_lambda_every_one_minute-lambda_udacity" -> null
      - rule           = "demo_lambda_every_one_minute" -> null
      - target_id      = "lambda_udacity" -> null
    }

  # aws_cloudwatch_log_group.example will be destroyed
  - resource "aws_cloudwatch_log_group" "example" {
      - arn               = "arn:aws:logs:us-east-1:883141128379:log-group:/aws/lambda/udacity_lambda_function" -> null
      - id                = "/aws/lambda/udacity_lambda_function" -> null
      - name              = "/aws/lambda/udacity_lambda_function" -> null
      - retention_in_days = 14 -> null
      - skip_destroy      = false -> null
      - tags              = {} -> null
      - tags_all          = {} -> null
    }

  # aws_iam_policy.lambda_logging will be destroyed
  - resource "aws_iam_policy" "lambda_logging" {
      - arn         = "arn:aws:iam::883141128379:policy/lambda_logging" -> null
      - description = "IAM policy for logging from a lambda" -> null
      - id          = "arn:aws:iam::883141128379:policy/lambda_logging" -> null
      - name        = "lambda_logging" -> null
      - path        = "/" -> null
      - policy      = jsonencode(
            {
              - Statement = [
                  - {
                      - Action   = [
                          - "logs:CreateLogGroup",
                          - "logs:CreateLogStream",
                          - "logs:PutLogEvents",
                        ]
                      - Effect   = "Allow"
                      - Resource = "arn:aws:logs:*:*:*"
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - policy_id   = "ANPA43H2QGC5T4SE3M7Y5" -> null
      - tags        = {} -> null
      - tags_all    = {} -> null
    }

  # aws_iam_role.iam_for_lambda will be destroyed
  - resource "aws_iam_role" "iam_for_lambda" {
      - arn                   = "arn:aws:iam::883141128379:role/iam_for_lambda" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "lambda.amazonaws.com"
                        }
                      - Sid       = ""
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2022-12-07T16:34:01Z" -> null
      - force_detach_policies = false -> null
      - id                    = "iam_for_lambda" -> null
      - managed_policy_arns   = [
          - "arn:aws:iam::883141128379:policy/lambda_logging",
        ] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "iam_for_lambda" -> null
      - path                  = "/" -> null
      - tags                  = {} -> null
      - tags_all              = {} -> null
      - unique_id             = "AROA43H2QGC56PYTZGSDU" -> null
    }

  # aws_iam_role_policy_attachment.lambda_logs will be destroyed
  - resource "aws_iam_role_policy_attachment" "lambda_logs" {
      - id         = "iam_for_lambda-20221207163403033500000001" -> null
      - policy_arn = "arn:aws:iam::883141128379:policy/lambda_logging" -> null
      - role       = "iam_for_lambda" -> null
    }

  # aws_lambda_function.udacity_lambda_function will be destroyed
  - resource "aws_lambda_function" "udacity_lambda_function" {
      - architectures                  = [
          - "x86_64",
        ] -> null
      - arn                            = "arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda" -> null
      - filename                       = "greet_lambda.zip" -> null
      - function_name                  = "udacity_lambda" -> null
      - handler                        = "greet_lambda.lambda_handler" -> null
      - id                             = "udacity_lambda" -> null
      - invoke_arn                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda/invocations" -> null
      - last_modified                  = "2022-12-07T16:34:29.009+0000" -> null
      - layers                         = [] -> null
      - memory_size                    = 128 -> null
      - package_type                   = "Zip" -> null
      - publish                        = false -> null
      - qualified_arn                  = "arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda:$LATEST" -> null
      - qualified_invoke_arn           = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda:$LATEST/invocations" -> null
      - reserved_concurrent_executions = -1 -> null
      - role                           = "arn:aws:iam::883141128379:role/iam_for_lambda" -> null
      - runtime                        = "python3.8" -> null
      - source_code_hash               = "KgcLk7ruPiX+tN3xGTZffI3onDFBaumAjKJLwbY4zm4=" -> null
      - source_code_size               = 248 -> null
      - tags                           = {} -> null
      - tags_all                       = {} -> null
      - timeout                        = 3 -> null
      - version                        = "$LATEST" -> null

      - environment {
          - variables = {
              - "greeting" = "Hello everyone!"
            } -> null
        }

      - ephemeral_storage {
          - size = 512 -> null
        }

      - tracing_config {
          - mode = "PassThrough" -> null
        }
    }

  # aws_lambda_permission.demo_lambda_every_one_minute will be destroyed
  - resource "aws_lambda_permission" "demo_lambda_every_one_minute" {
      - action        = "lambda:InvokeFunction" -> null
      - function_name = "udacity_lambda" -> null
      - id            = "AllowExecutionFromCloudWatch" -> null
      - principal     = "events.amazonaws.com" -> null
      - source_arn    = "arn:aws:events:us-east-1:883141128379:rule/demo_lambda_every_one_minute" -> null
      - statement_id  = "AllowExecutionFromCloudWatch" -> null
    }

Plan: 0 to add, 0 to change, 8 to destroy.

Changes to Outputs:
  - lambda_arn = "arn:aws:lambda:us-east-1:883141128379:function:udacity_lambda" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_cloudwatch_event_target.lambda_udacity: Destroying... [id=demo_lambda_every_one_minute-lambda_udacity]
aws_lambda_permission.demo_lambda_every_one_minute: Destroying... [id=AllowExecutionFromCloudWatch]
aws_lambda_permission.demo_lambda_every_one_minute: Destruction complete after 1s
aws_cloudwatch_event_target.lambda_udacity: Destruction complete after 1s
aws_cloudwatch_event_rule.demo_lambda_every_one_minute: Destroying... [id=demo_lambda_every_one_minute]
aws_cloudwatch_event_rule.demo_lambda_every_one_minute: Destruction complete after 0s
aws_lambda_function.udacity_lambda_function: Destroying... [id=udacity_lambda]
aws_lambda_function.udacity_lambda_function: Destruction complete after 1s
aws_cloudwatch_log_group.example: Destroying... [id=/aws/lambda/udacity_lambda_function]
aws_iam_role_policy_attachment.lambda_logs: Destroying... [id=iam_for_lambda-20221207163403033500000001]
aws_iam_role_policy_attachment.lambda_logs: Destruction complete after 0s
aws_cloudwatch_log_group.example: Destruction complete after 0s
aws_iam_policy.lambda_logging: Destroying... [id=arn:aws:iam::883141128379:policy/lambda_logging]
aws_iam_role.iam_for_lambda: Destroying... [id=iam_for_lambda]
aws_iam_policy.lambda_logging: Destruction complete after 1s
aws_iam_role.iam_for_lambda: Destruction complete after 1s

Destroy complete! Resources: 8 destroyed.
````
1. Upload Terraform files, screenshots, schematics and CSV files to your GitHub repo
Before submitting your project, please check to confirm that you have completed all of the requirements in the **Project Rubric**.
