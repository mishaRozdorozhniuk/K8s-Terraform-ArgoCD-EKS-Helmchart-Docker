terraform {
  backend "s3" {
    bucket         = "misha-devops-final-project-2026"
    key            = "eks/terraform.tfstate"
    encrypt        = true
      # dynamodb_table = "lock-tf-eks"
    # dynamo key LockID
    # Params tekan from -backend-config when terraform init
    region = "eu-central-1"
    profile = "default"
  }
}
