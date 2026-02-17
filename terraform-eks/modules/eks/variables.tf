variable "cluster_name" {
  description = "EKS Cluster Name"      
  type = string
}
variable "cluster_version" {
  type = string
  description = "EKS Cluster version"
  default = "1.0"
}

variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "private_subnets_ids" {
    description = "private subnet id for eks"
    type = list(string)
}
variable "node_instance_types" {
  description = "instance types for worker nodes"
  type = list(string)
  default = [ "t3.medium" ]
}
variable "desired_size" {
  type = number
  default = 1
}
variable "min_size" {
  type = number
  default = 1
}
variable "max_size" {
  type = number
  default = 3
}