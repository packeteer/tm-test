# TM Test - WIP

## Architecture Overview

This project sets up an API Gateway to talk to a Lambda with logging and metrics sent to Cloudwatch

## Prerequisites

This project depends on the following, please make sure they're available

* NodeJS v14.17.0
* serverless v2.44.0
* serverless-plugin-resource-tagging
* working AWS account with Admin access

## Deploy to AWS

Please ensure you have your AWS credentials setup, then run:
````bash
sls deploy
````

The expected result should be similar to:

```bash
Serverless: Packaging service...
Serverless: Excluding development dependencies...
Serverless: Installing dependencies for custom CloudFormation resources...
Serverless: Updated AWS resource tags..
Serverless: Creating Stack...
Serverless: Checking Stack create progress...
........
Serverless: Stack create finished...
Serverless: Uploading CloudFormation file to S3...
Serverless: Uploading artifacts...
Serverless: Uploading service tm-test.zip file to S3 (52.07 KB)...
Serverless: Uploading custom CloudFormation resources...
Serverless: Validating template...
Serverless: Updating Stack...
Serverless: Checking Stack update progress...
.........................................
Serverless: Stack update finished...
Service Information
service: tm-test
stage: production
region: ap-southeast-2
stack: tm-test-production
resources: 14
api keys:
  None
endpoints:
  GET - https://ofri4htwfl.execute-api.ap-southeast-2.amazonaws.com/production/
functions:
  hello: tm-test
layers:
  None
Serverless: Updated AWS resource tags..
Serverless: Updated APIGateway resource tags..
````
## Usage

You can now send an HTTP request directly to the endpoint using a tool like curl

```bash
curl https://XXXXXXX.execute-api.ap-southeast-2.amazonaws.com/production
```
## Notes on admin
If you wanted to give operational control to another team, you could use something like the following, or better yet, use the provided [terraform code](./terraform/README.md):

````bash
aws iam create-group --group-name operations
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator --group-name operations
aws iam attach-group-policy --policy-arn arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess --group-name operations
````

## Notes on scaling

By default, AWS Lambda limits the total concurrent executions across all functions within a given region (max 500 in most regions). The default limit is a safety limit that protects you from costs due to potential runaway or recursive functions during initial development and testing. To increase this limit above the default, contact AWS Support

Alternatively, enable caching per this doc: https://www.serverless.com/plugins/serverless-api-gateway-caching

