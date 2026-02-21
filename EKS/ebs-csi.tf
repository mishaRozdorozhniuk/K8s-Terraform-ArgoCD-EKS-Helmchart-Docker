module "ebs-csi-driver" {
  source  = "DrFaust92/ebs-csi-driver/kubernetes"
  version = "3.10.0"

  ebs_csi_controller_role_name               = "ebs-csi-${var.name}-controller"
  ebs_csi_controller_role_policy_name_prefix = "ebs-csi-${var.name}-policy"
  oidc_url                                   = aws_eks_cluster.danit.identity[0].oidc[0].issuer
  enable_volume_resizing                     = true
}
