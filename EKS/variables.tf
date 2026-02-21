variable "name" {
  description = "Name of the project"
  type        = string
  default     = "misha"
}

variable "vpc_id" {
  description = "ID of the default VPC"
  type        = string
  default     = "vpc-0e9ce6f45b6762d99"
}

variable "subnets_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = [
    "subnet-067b46c896bbe7898",
    "subnet-043632b1e25028b4b",
    "subnet-08759cdae19a0a977"
  ]
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Project     = "Final-Project"
    Owner       = "Misha"
    Environment = "Dev"
  }
}

variable "region" {
  description = "aws region"
  default     = "eu-central-1"
}

### Backend vars
variable "iam_profile" {
  description = "Profile of aws creds"
  default     = null
}

variable "zone_name" {
  description = "Domain name for Route53"
  type        = string
  default     = "devops10.test-danit.com"
}
