# To enable ArgoCD use this documentation:
# https://registry.terraform.io/modules/lablabs/eks-external-dns/aws/latest

module "eks-external-dns" {
  source                           = "lablabs/eks-external-dns/aws"
  version                          = "2.1.1"
  cluster_identity_oidc_issuer     = aws_eks_cluster.danit.identity.0.oidc.0.issuer
  cluster_identity_oidc_issuer_arn = module.oidc-provider-data.arn
  irsa_role_name_prefix            = var.name
}

