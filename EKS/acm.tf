resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  version    = "5.46.7"
  create_namespace = true

  values = [
    <<-EOF
    server:
      extraArgs:
        - --insecure
      ingress:
        enabled: true
        ingressClassName: nginx
        hosts:
          - argocd.${var.name}.${var.zone_name}
        annotations:
          kubernetes.io/ingress.class: nginx
    EOF
  ]

  depends_on = [
    aws_eks_node_group.danit,
    helm_release.nginx_ingress
  ]
}
