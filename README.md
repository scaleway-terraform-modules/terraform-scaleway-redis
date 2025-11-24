# Terraform / Scaleway

## Purpose

This repository is used to manage a Redis cluster on scaleway using terraform.

## Usage

- Setup the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) in your tf file.
- Include this module in your tf file. Refer to [documentation](https://www.terraform.io/docs/modules/sources.html#generic-git-repository).

```hcl
module "my_cluster" {
  source  = "scaleway-terraform-modules/redis/scaleway"
  version = "0.0.1"

}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.13 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway) | >= 2.3.0 |

## Resources

| Name | Type |
|------|------|
| [scaleway_redis_cluster.this](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/redis_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name) | Name of the Redis Cluster. | `string` | n/a | yes |
| <a name="input_user_name"></a> [user_name](#input_user_name) | Identifier for the first user of the Redis Cluster. | `string` | n/a | yes |
| <a name="input_user_password"></a> [user_password](#input_user_password) | Password for the first user of the Redis Cluster. | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster_size](#input_cluster_size) | Nnumber of nodes in the Redis Cluster. | `number` | `1` | no |
| <a name="input_cluster_version"></a> [cluster_version](#input_cluster_version) | Redis's Cluster version (e.g. `6.2.6`). | `string` | `"7.0.5"` | no |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | Type of Redis Cluster you want to create. | `string` | `"RED1-MICRO"` | no |
| <a name="input_network_acls"></a> [network_acls](#input_network_acls) | List of acl rules (ie IP addresses authorized to connect to the cluster). | ```list(object({ ip = string description = string }))``` | ```[ { "description": "Allow all", "ip": "0.0.0.0/0" } ]``` | no |
| <a name="input_private_network"></a> [private_network](#input_private_network) | Describes the private network you want to connect to your cluster. If not set, a public network will be provided. | ```object({ id = string service_ips = optional(list(string)) })``` | `null` | no |
| <a name="input_project_id"></a> [project_id](#input_project_id) | ID of the project the namespace is associated with. Ressource will be created in the project set at the provider level if null. | `string` | `null` | no |
| <a name="input_settings"></a> [settings](#input_settings) | Optional map of settings for the Redis™ cluster. Refer to Scaleway API/CLI for valid settings. | `map(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags associated with the server and dedicated ip address. | `list(string)` | `[]` | no |
| <a name="input_tls_enabled"></a> [tls_enabled](#input_tls_enabled) | Whether TLS is enabled or not. | `bool` | `true` | no |
| <a name="input_zone"></a> [zone](#input_zone) | The zone in which the Redis Cluster should be created. Ressource will be created in the zone set at the provider level if null. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_certificate"></a> [cluster_certificate](#output_cluster_certificate) | PEM of the certificate used by redis. |
| <a name="output_cluster_id"></a> [cluster_id](#output_cluster_id) | ID of the Database Instance. |
<!-- END_TF_DOCS -->

## Authors

Module is maintained with help from [the community](https://github.com/scaleway-terraform-modules/terraform-scaleway-redis/graphs/contributors).

## License

Mozilla Public License 2.0 Licensed. See [LICENSE](https://github.com/scaleway-terraform-modules/terraform-scaleway-redis/tree/master/LICENSE) for full details.
