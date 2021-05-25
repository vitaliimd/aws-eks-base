## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| helm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_autoscaler\_chart\_version | Version of cluster autoscaler helm chart | `string` | `"9.9.2"` | no |
| cluster\_autoscaler\_version | Version of cluster autoscaler | `string` | `"v1.19.0"` | no |
| eks\_cluster\_id | EKS cluster ID | `string` | n/a | yes |
| eks\_oidc\_provider\_arn | ARN of EKS oidc provider | `string` | n/a | yes |
| helm\_release\_history\_size | How much helm releases to store | `number` | `5` | no |
| helm\_release\_wait | Will wait until all resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to true. | `string` | `false` | no |
| helm\_repo\_cluster\_autoscaler | Repository name for kube-prometheus-stack | `string` | `"https://kubernetes.github.io/autoscaler"` | no |
| kubernetes\_namespace | Name of kubernetes namespace for prometheus stack | `string` | `"sys"` | no |
| name | Project name, required to create unique resource names | `string` | n/a | yes |
| region | Default infrastructure region | `string` | n/a | yes |
| service\_monitor\_enable | Depends on kube-prometheus-stack | `any` | `null` | no |

## Outputs

No output.

