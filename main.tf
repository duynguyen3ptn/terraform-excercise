provider "aws" {
  region = "us-east-1"
}

module "lambda" {
  source                = "./modules/lambda"
  lambda_function_name  = "terraform_lambda_func"
  lambda_role_name      = "Spacelift_Test_Lambda_Function_Role"
  lambda_policy_name    = "aws_iam_policy_for_terraform_aws_lambda_role"
  source_dir            = "${path.module}/python/"
  environment_variables = { ENV = "dev" }
  vpc_id                = "vpc-04fbe67b5f47dc934" # Replace with your VPC ID
  subnet_ids            = ["subnet-12345678", "subnet-87654321"] # Replace with your Subnet IDs
  tags = {
    Name        = "terraform_lambda_func"
    Environment = "dev"
  }
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "cloudwatch" {
  source              = "./modules/cloudwatch"
  lambda_function_name = module.lambda.lambda_function_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "my-app-bucket"
  acl         = "private"
  tags = {
    Name        = "my-app-bucket"
    Environment = "dev"
  }
}

module "api_gateway" {
  source           = "./modules/api_gateway"
  api_name         = "my-app-api"
  api_description  = "API Gateway for my application"
  resource_path    = "my-resource"
  http_method      = "ANY"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  stage_name       = "dev"
}

module "cloudfront" {
  source                = "./modules/cloudfront"
  s3_bucket_name        = module.s3.bucket_name
  s3_bucket_domain_name = module.s3.bucket_arn
  tags = {
    Name        = "my-cloudfront-distribution"
    Environment = "dev"
  }
}

module "ec2" {
  source                  = "./modules/ec2"
  vpc_id                  = "vpc-04fbe67b5f47dc934" 
  ami_id                  = "ami-084568db4383264d4" 
  key_name                = "terraform-ec2" 
  allowed_ssh_cidr_blocks = ["0.0.0.0/0"]
  tags = {
    Name        = "bastion-host"
    Environment = "dev"
  }
}
