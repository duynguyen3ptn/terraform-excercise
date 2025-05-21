variable "api_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "api_description" {
  description = "The description of the API Gateway"
  type        = string
  default     = "API Gateway for the application"
}

variable "resource_path" {
  description = "The path for the API resource"
  type        = string
}

variable "http_method" {
  description = "The HTTP method for the API Gateway method"
  type        = string
  default     = "ANY"
}

variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function to invoke"
  type        = string
}

variable "stage_name" {
  description = "The stage name for the API Gateway deployment"
  type        = string
  default     = "dev"
}
