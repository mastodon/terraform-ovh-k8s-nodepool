# Mastodon Terraform - OVHCloud Kubernetes Nodepool

Creates a nodepool for a Managed Kubernetes cluster in OVH.

While the [full kubernetes module](https://github.com/mastodon/terraform-ovh-k8s) also supports nodepools, there are some situations where nodepools need to be created and deleted ad-hoc. This makes that situation easier to manage by allowing the management of each nodepool separately.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | ~> 2.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 2.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project_kube_nodepool.node_pool](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube_nodepool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability zones to create the nodes in (for multi-AZ clusters). | `list(string)` | `[]` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ID of the cluster for the nodepool. | `string` | n/a | yes |
| <a name="input_flavor_name"></a> [flavor\_name](#input\_flavor\_name) | The type of nodes to use for this nodepool. | `string` | n/a | yes |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Minimum number of nodes this nodepool can have. | `number` | `0` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Maximum number of nodes this nodepool can have. | `number` | `0` | no |
| <a name="input_monthly_billed"></a> [monthly\_billed](#input\_monthly\_billed) | Should the nodes be billed on a monthly basis. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to give the nodepool. | `string` | n/a | yes |
| <a name="input_nodes"></a> [nodes](#input\_nodes) | Number of nodes in this nodepool. | `number` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the Public Cloud project the resources will be created in. | `string` | n/a | yes |
| <a name="input_template"></a> [template](#input\_template) | Nodepool template for applying metadata. | <pre>object({<br>    annotations   = optional(map(any), {})<br>    labels        = optional(map(any), {})<br>    finalizers    = optional(list(string), [])<br>    unschedulable = optional(bool, false)<br>    taints = optional(list(object({<br>      effect = string<br>      key    = string<br>      value  = string<br>    })), [])<br>  })</pre> | `null` | no |

## Outputs

No outputs.
