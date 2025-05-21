# Terraform AWS Infrastructure

This project provisions a complete AWS infrastructure using Terraform. The architecture includes services such as Lambda, DynamoDB, API Gateway, CloudFront, EC2, S3, and CloudWatch, as shown in the diagram below.

## Architecture Diagram

![AWS Architecture Diagram](./architecture-diagram.png)

## Modules

The project is modularized into the following components:

### 1. **Lambda**
- Provisions an AWS Lambda function with associated IAM roles and policies.
- Configurable environment variables, VPC settings, and tags.

### 2. **DynamoDB**
- Creates DynamoDB tables for `users`, `articles`, and `comments`.
- Configurable table names and tags.

### 3. **CloudWatch**
- Sets up CloudWatch log groups and alarms for monitoring Lambda functions.

### 4. **S3**
- Provisions an S3 bucket with configurable ACL and tags.

### 5. **API Gateway**
- Creates an API Gateway with a resource path and integration with the Lambda function.

### 6. **CloudFront**
- Configures a CloudFront distribution with an S3 bucket as the origin.

### 7. **EC2**
- Provisions a bastion host in a public subnet with a security group allowing SSH access.

## Prerequisites

- Terraform installed on your local machine.
- AWS credentials configured for Terraform to use.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/terraform-aws-infra.git
   cd terraform-aws-infra
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Review the execution plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Destroy the infrastructure (if needed):
   ```bash
   terraform destroy
   ```

## Configuration

### Variables

Each module has its own set of variables. Below are some key variables:

- **Lambda Module**
  - `lambda_function_name`: Name of the Lambda function.
  - `vpc_id`: VPC ID where the Lambda function will be deployed.
  - `subnet_ids`: List of subnet IDs for the Lambda function.

- **S3 Module**
  - `bucket_name`: Name of the S3 bucket.
  - `acl`: Access control list for the bucket.

- **EC2 Module**
  - `ami_id`: AMI ID for the EC2 instance.
  - `key_name`: Name of the SSH key pair.

Refer to the `variables.tf` files in each module for more details.

### Outputs

The project provides outputs such as:
- Lambda function name and ARN.
- S3 bucket name and ARN.
- API Gateway endpoint.
- CloudFront distribution domain name.
- EC2 instance ID and public IP.

## Diagram Source

The architecture diagram is located in the root directory as `architecture-diagram.png`. Update it as needed to reflect changes in the infrastructure.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.