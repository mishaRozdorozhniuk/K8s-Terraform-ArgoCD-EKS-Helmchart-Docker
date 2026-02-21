# Here we must set our profile, otherwise infra will be created in the root account
provider "aws" {
  region  = var.region
  profile = var.iam_profile
}

provider "kubernetes" {
  host                   = aws_eks_cluster.danit.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.danit.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.danit.token
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.12.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = aws_eks_cluster.danit.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.danit.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.danit.token
  }
}

data "aws_availability_zones" "available" {}
