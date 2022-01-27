variable "intersight_api_key" {
  type        = string
  description = "API Key"
}
variable "intersight_secret_key" {
  type        = string
  description = "Secret Key or file location"
}

variable "iks_cluster_name" {
  type        = string
  description = "Name of IKS cluster"
}

variable "iks_ssh_user" {
  type        = string
  description = "SSH Username for node login."
}
variable "iks_ssh_key" {
  type        = string
  description = "SSH Public Key to be used to node login."
}

variable "intersight_endpoint" {
  type        = string
  description = "API Endpoint URL"
  default     = "https://www.intersight.com"
}
variable "intersight_organization" {
  type        = string
  description = "Organization Name"
  default     = "default"
}
