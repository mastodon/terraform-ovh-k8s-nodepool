resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name       = var.project_id
  kube_id            = var.cluster_id
  name               = var.name
  flavor_name        = var.flavor_name
  desired_nodes      = var.nodes
  max_nodes          = var.max_nodes < 1 ? var.nodes : var.max_nodes
  min_nodes          = var.min_nodes < 1 ? var.nodes : var.min_nodes
  monthly_billed     = var.monthly_billed
  availability_zones = var.availability_zones

  dynamic "template" {
    for_each = var.template != null ? [1] : []

    content {
      metadata {
        annotations = var.template["annotations"]
        finalizers  = var.template["finalizers"]
        labels      = var.template["labels"]
      }
      spec {
        unschedulable = var.template["unschedulable"]
        taints        = var.template["taints"]
      }
    }
  }
}
