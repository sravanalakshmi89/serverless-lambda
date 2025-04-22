terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

module "s3" {
  source             = "./modules/s3"
  source_bucket_name = var.source_bucket_name
  target_bucket_name = var.target_bucket_name

  remote_state_bucket_name = var.remote_state_bucket_name
}

module "lambda" {
  source                    = "./modules/lambda"
  lambda_function_name      = var.lambda_function_name
  runtime                   = var.lambda_runtime
  role_arn                  = var.lambda_role_arn
  lambda_handler            = var.lambda_handler
  source_bucket             = module.s3.source_bucket_name
  target_bucket             = module.s3.target_bucket_name
  memory_size               = var.lambda_memory_size
  timeout                   = var.lambda_timeout
  api_gateway_execution_arn = module.api_gateway.execution_arn
}

module "api_gateway" {
  source            = "./modules/api_gateway"
  api_gateway_name  = var.api_gateway_name
  api_gateway_stage = var.api_gateway_stage
  #lambda_function_arn    = module.lambda.lambda_function_arn
  lambda_invoke_arn    = module.lambda.lambda_invoke_arn
  lambda_function_name = module.lambda.lambda_function_name
  #api_gateway_execution_arn = module.api_gateway.api_gateway_execution_arn
}

module "SQS" {
  source                     = "./modules/sqs"
  queue_name                 = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  fifo_queue                 = var.fifo_queue
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
}

