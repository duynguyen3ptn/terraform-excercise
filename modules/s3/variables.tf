variable "bucket_name" {
  description = "The name of the S3 bucket duynt"
  type        = string
  default     = "s3 duy nt"
}

variable "acl" {
  description = "The access control list (ACL) for the bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}
