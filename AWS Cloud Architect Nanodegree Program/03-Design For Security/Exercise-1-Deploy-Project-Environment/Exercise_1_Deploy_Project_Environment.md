# Exercise 1 - Deploy Project Environment
____

## Task 1: Review Architecture Diagram

<img width="70%" src="./figure/AWS-WebServiceDiagram-v1-insecure.png">
<p style='text-align: center; margin-right: 3em; font-family: Serif;'><b> Starting architecture diagram</b></p>
____

## Task 2: Review CloudFormation Template

In this task, the objective is to familiarize yourself with the starter code and to get you up and running quickly. Spend a few minutes going through the ``.yml`` files in the starter folder to get a feel for how parts of the code will map to the components in the architecture diagram.

Additionally, a CloudFormation template have been provided which will deploy the following resources in AWS:

#### VPC Stack for the underlying network

* A VPC with 2 public subnets, one private subnet, and internet gateways etc for internet access.

#### S3 bucket stack

* 2 S3 buckets that will contain data objects for the application.
````YAML
Description:  This template deploys an S3 bucket for storage of recipes.

Resources:
  S3BucketRecipesFree:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Join [ "-", [ "cand-c3-free-recipes", !Ref 'AWS::AccountId' ] ]
  S3BucketRecipesSecret:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Join [ "-", [ "cand-c3-secret-recipes", !Ref 'AWS::AccountId' ] ]
  S3BucketVPCFlowLogs:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: !Join [ "-", [ "cand-c3-vpc-flow-logs", !Ref 'AWS::AccountId' ] ]

Outputs:
  BucketNameRecipesFree:
    Value: !Ref 'S3BucketRecipesFree'
    Description: Name of the Amazon S3 bucket that you will upload free recipes to.
    Export:
      Name: BucketNameRecipesFree
  BucketNameRecipesSecret:
    Value: !Ref 'S3BucketRecipesSecret'
    Description: Name of the Amazon S3 bucket that you will upload secret recipes to.
    Export:
      Name: BucketNameRecipesSecret
  BucketArnVPCFlowLogs:
    Value: !GetAtt S3BucketVPCFlowLogs.Arn
    Description: Arn of the Amazon S3 bucket that have vpc flow logs for this project
    Export:
      Name: BucketArnVPCFlowLogs

````
#### Application stack

* An EC2 instance that will act as an external attacker from which we will test the ability of our environment to handle threats

* An EC2 instance that will be running a simple web service.

* Application LoadBalancer

* Security groups

* IAM role
