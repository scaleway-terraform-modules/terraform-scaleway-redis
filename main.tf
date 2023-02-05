resource "scaleway_redis_cluster" "this" {
  name = var.cluster_name
  tags = var.tags

  # Cluster typology
  node_type    = var.instance_type
  cluster_size = var.cluster_size
  version      = var.cluster_version

  # Cluster security
  tls_enabled = var.tls_enabled
  user_name   = var.user_name
  password    = var.user_password

  # Cluster location
  zone       = var.zone
  project_id = var.project_id

  # Network ACLs
  dynamic "acl" {
    for_each = var.network_acls
    content {
      ip          = acl.value["ip"]
      description = acl.value["description"]
    }
  }

  dynamic "private_network" {
    for_each = var.private_network != null ? [1] : []
    content {
      id          = try(var.private_network.id, null)
      service_ips = try(var.private_network.service_ips, null)
    }
  }
}
