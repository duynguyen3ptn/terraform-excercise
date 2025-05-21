variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda"
  type        = string
}

variable "lambda_policy_name" {
  description = "The name of the IAM policy for Lambda"
  type        = string
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "source_dir" {
  description = "The directory containing the Lambda function code"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to apply to the Lambda function"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The ID of the VPC where the Lambda function will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the Lambda function"
  type        = list(string)
}
