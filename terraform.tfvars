# terraform-dev.tfvars

# AWS region is defined in variables.tf or main.tf

# Lambda function name
lambda_function_name = "greeting-app-dev"

# API Gateway stage name
api_gateway_stage  = "dev"
api_gateway_name   = "test-greeting-app-dev"
source_bucket_name = "greeting-app-dev-source-bucket1234"
target_bucket_name = "greeting-app-dev-target-bucket1234"
# Lambda function runtime
lambda_runtime = "python3.8"
# Lambda function memory size (in MB)
lambda_memory_size = 128
# Lambda function timeout (in seconds)
lambda_timeout = 30
# Lambda function handler
lambda_handler = "lambda_function.lambda_handler"
# IAM role ARN for Lambda function
lambda_role_arn = "arn:aws:iam::123456789012:role/lambda-execution-role"

# Tags for resources
queue_name                 = "greeting-app-dev-queue"
visibility_timeout_seconds = 120
message_retention_seconds  = 86400
fifo_queue                 = false
delay_seconds              = 0
max_message_size           = 262144

remote_state_bucket_name = "greeting-app-dev-remote-state-bucket1234"
# S3 bucket names for source and target buckets
