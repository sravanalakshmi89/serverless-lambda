variable "source_bucket_name" {
  description = "The name of the S3 bucket for storing employee photos"
  type        = string
}

variable "target_bucket_name" {
  description = "The name of the S3 bucket for storing generated greeting cards"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the AWS Lambda function"
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "lambda_memory_size" {
  description = "The amount of memory allocated to the Lambda function"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "The timeout in seconds for the Lambda function"
  type        = number
  default     = 30
}

variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "api_gateway_stage" {
  description = "The stage for the API Gateway"
  type        = string
  default     = "dev"
}

# variable "lambda_function_invoke_url" {
#   description = "The invoke URL for the Lambda function"
#   type        = string
# }
variable "lambda_role_arn" {
  description = "The ARN of the IAM role that Lambda assumes when it executes the function"
  type        = string
}
variable "lambda_handler" {
  description = "The function entry point in the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}
variable "api_gateway_arn" {
  description = "The ARN of the API Gateway that triggers the Lambda function"
  type        = string
  default     = "value"
}

variable "queue_name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "delay_seconds" {
  description = "The time in seconds for which the delivery of all messages in the queue is delayed"
  type        = number
  default     = 0
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message"
  type        = number
  default     = 345600
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue in seconds"
  type        = number
  default     = 30
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it"
  type        = number
  default     = 262144
}

variable "fifo_queue" {
  description = "Boolean indicating whether this queue is a FIFO queue"
  type        = bool
  default     = false
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues"
  type        = bool
  default     = false
}