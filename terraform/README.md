# TM Test - WIP

## Overview

This code can be used to create a group with specific permissions to administer the API Gateway and view Cloudwatch logs and metrics

## Prerequisites

This project depends on the following, please make sure they're available

* Terraform v15 or later
* working AWS account with Admin access

## Deploy to AWS

Please ensure you have your AWS credentials setup, then run:
````bash
terraform init
terraform plan
````

The expected result should be similar to:

```bash
  # aws_iam_group.group will be created
  + resource "aws_iam_group" "group" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "operations"
      + path      = "/"
      + unique_id = (known after apply)
    }

  # aws_iam_group_policy_attachment.apigw will be created
  + resource "aws_iam_group_policy_attachment" "apigw" {
      + group      = "operations"
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
    }

  # aws_iam_group_policy_attachment.cw will be created
  + resource "aws_iam_group_policy_attachment" "cw" {
      + group      = "operations"
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
    }

Plan: 3 to add, 0 to change, 0 to destroy.
````
## Usage

If you're happy to proceed, apply to code with the following command:

```bash
terraform apply
```
