variable "cluster_name" {
  description = "Name of the Redis Cluster."
  type        = string
}

variable "cluster_size" {
  description = "Nnumber of nodes in the Redis Cluster."
  type        = number
  default     = 1
}

variable "cluster_version" {
  description = "Redis's Cluster version (e.g. `6.2.6`)."
  type        = string
  default     = "7.0.5"
}

variable "instance_type" {
  description = "Type of Redis Cluster you want to create."
  type        = string
  default     = "RED1-MICRO"
}

variable "network_acls" {
  description = "List of acl rules (ie IP addresses authorized to connect to the cluster)."
  type = list(object({
    ip          = string
    description = string
  }))
  default = [{
    ip          = "0.0.0.0/0"
    description = "Allow all"
  }]
}

variable "private_network" {
  description = "Describes the private network you want to connect to your cluster. If not set, a public network will be provided."
  type = object({
    id          = string
    service_ips = list(string)
  })
  default = null
}

variable "project_id" {
  description = "ID of the project the namespace is associated with. Ressource will be created in the project set at the provider level if null."
  type        = string
  default     = null
}

variable "zone" {
  description = "The zone in which the Redis Cluster should be created. Ressource will be created in the zone set at the provider level if null."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags associated with the server and dedicated ip address."
  type        = list(string)
  default     = []
}

variable "tls_enabled" {
  description = "Whether TLS is enabled or not."
  type        = bool
  default     = true
}

variable "user_name" {
  description = "Identifier for the first user of the Redis Cluster."
  type        = string
}

variable "user_password" {
  description = "Password for the first user of the Redis Cluster."
  type        = string
  sensitive   = true
}
