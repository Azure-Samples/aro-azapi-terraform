variable "resource_prefix" {
  description = "Specifies the name prefix for all the Azure resources."
  type        = string
}

variable "location" {
  description = "Specifies the location of Azure resource."
  default     = "eastus"
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the name of the resource group."
  type        = string
}

variable "domain" {
  description = "Specifies the domain prefix of the Azure Red Hat OpenShift cluster."
  default     = ""
  type        = string
}

variable "pull_secret" {
  description = "Specifies the pull secret from cloud.redhat.com. The JSON should be provided as a string."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Specifies the address space of the virtual virtual network hosting the Azure Red Hat OpenShift cluster."
  default     = ["10.100.0.0/15"]
  type        = list(string)
}

variable "worker_subnet_name" {
  description = "Specifies the name of the worker node subnet."
  default     = "worker"
  type        = string
}

variable "worker_subnet_address_space" {
  description = "Specifies the address space of the worker node subnet."
  default     = ["10.100.70.0/23"]
  type        = list(string)
}

variable "master_subnet_name" {
  description = "Specifies the name of the master node subnet."
  default     = "master"
  type        = string
}

variable "master_subnet_address_space" {
  description = "Specifies the address space of the master node subnet."
  default     = ["10.100.76.0/24"]
  type        = list(string)
}

variable "worker_node_vm_size" {
  description = "Specifies the VM size for worker nodes of the Azure Red Hat OpenShift cluster."
  default     = "Standard_D4s_v3"
  type        = string
}

variable "master_node_vm_size" {
  description = "Specifies the VM size for master nodes of the Azure Red Hat OpenShift cluster."
  default     = "Standard_D8s_v3"
  type        = string
}

variable "worker_profile_name" {
  description = "Specifies the name of the worker profile of the Azure Red Hat OpenShift cluster."
  default     = "worker"
  type        = string
}

variable "worker_node_vm_disk_size" {
  description = "Specifies the VM disk size for worker nodes of the Azure Red Hat OpenShift cluster."
  default     = 128
  type        = number
}

variable "worker_node_count" {
  description = "Specifies the number of worker nodes of the Azure Red Hat OpenShift cluster."
  default     = 3
  type        = number
}

variable "pod_cidr" {
  description = "Specifies the CIDR for the pods."
  default     = "10.128.0.0/14"
  type        = string
}

variable "service_cidr" {
  description = "Specifies the CIDR for the services."
  default     = "172.30.0.0/16"
  type        = string
}

variable "tags" {
  description = "(Optional) Specifies tags for all the resources"
  default     = {
    createdWith = "Terraform"
    environment = "Development"
    department  = "Ops"
  }
}

variable "api_server_visibility" {
  description = "Specifies the API Server visibility for the Azure Red Hat OpenShift cluster."
  default  = "Public" 
  validation {
    condition = contains(["Private", "Public"], var.api_server_visibility)
    error_message = "The value of the api_server_visibility parameter is invalid."
  }
}

variable "ingress_profile_name" {
  description = "Specifies the name of the ingress profile of the Azure Red Hat OpenShift cluster."
  default     = "default"
  type        = string
}

variable "ingress_visibility" {
  description = "Specifies the ingress visibility for the Azure Red Hat OpenShift cluster."
  default  = "Public" 
  validation {
    condition = contains(["Private", "Public"], var.ingress_visibility)
    error_message = "The value of the ingress_visibility parameter is invalid."
  }
}

variable "fips_validated_modules" {
  description = "Specifies whether FIPS validated crypto modules are used."
  default  = "Disabled" 
  validation {
    condition = contains(["Disabled", "Enabled"], var.fips_validated_modules)
    error_message = "The value of the fips_validated_modules parameter is invalid."
  }
}

variable "master_encryption_at_host" {
  description = "Specifies whether master virtual machines are encrypted at host."
  default  = "Disabled" 
  validation {
    condition = contains(["Disabled", "Enabled"], var.master_encryption_at_host)
    error_message = "The value of the master_encryption_at_host parameter is invalid."
  }
}

variable "worker_encryption_at_host" {
  description = "Specifies whether master virtual machines are encrypted at host."
  default  = "Disabled" 
  validation {
    condition = contains(["Disabled", "Enabled"], var.worker_encryption_at_host)
    error_message = "The value of the worker_encryption_at_host parameter is invalid."
  }
}

variable "aro_cluster_aad_sp_client_id" {
  description = "Specifies the client id of the service principal of the Azure Red Hat OpenShift cluster."
  type        = string
}

variable "aro_cluster_aad_sp_client_secret" {
  description = "Specifies the client secret of the service principal of the Azure Red Hat OpenShift cluster."
  type        = string
}

variable "aro_cluster_aad_sp_object_id" {
  description = "Specifies the object id of the service principal of the Azure Red Hat OpenShift cluster."
  type        = string
}

variable "aro_rp_aad_sp_object_id" {
  description = "Specifies the object id of the service principal of the ARO resource provider."
  type        = string
}