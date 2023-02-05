output "cluster_certificate" {
  description = "PEM of the certificate used by redis."
  value       = scaleway_redis_cluster.this.certificate
}

output "cluster_id" {
  description = "ID of the Database Instance."
  value       = scaleway_redis_cluster.this.id
}
