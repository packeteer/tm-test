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

Please ensure you have your AWS credentials setup, then run *sls deploy*

## Notes on scaling

By default, AWS Lambda limits the total concurrent executions across all functions within a given region (max 500 in most regions). The default limit is a safety limit that protects you from costs due to potential runaway or recursive functions during initial development and testing. To increase this limit above the default, contact AWS Support
