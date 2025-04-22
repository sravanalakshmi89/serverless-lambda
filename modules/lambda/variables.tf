variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "role_arn" {
  description = "The ARN of the IAM role that Lambda assumes when it executes the function"
  type        = string
}

variable "lambda_handler" {
  description = "The function entry point in the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "source_bucket" {
  description = "The source S3 bucket for employee photos"
  type        = string
}

variable "target_bucket" {
  description = "The target S3 bucket for generated greeting cards"
  type        = string
}

variable "memory_size" {
  description = "The amount of memory available to the function"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "The amount of time that Lambda allows a function to run before stopping it"
  type        = number
  default     = 3
}

variable "api_gateway_execution_arn" {
  description = "The execution ARN of the API Gateway"
  type        = string
}

variable "api_gateway_stage" {
  description = "The stage name of the API Gateway"
  type        = string
  default     = "dev"

}

variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function that is invoked by the API Gateway"
  type        = string
}