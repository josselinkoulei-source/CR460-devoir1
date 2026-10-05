variable "azure_region" {
  description = "Region Azure des ressources"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "rg-cr460-devoir1-jkoulei"
}

variable "vnet_name" {
  description = "Nom du reseau virtuel"
  type        = string
  default     = "vnet-cr460-devoir1-jkoulei"
}

variable "subnet_name" {
  description = "Nom du sous-reseau"
  type        = string
  default     = "snet-cr460-vm"
}

variable "nic_name" {
  description = "Nom de l'interface reseau"
  type        = string
  default     = "nic-cr460-vm"
}

variable "vm_name" {
  description = "Nom de la machine virtuelle"
  type        = string
  default     = "vm-cr460-devoir1"
}

variable "vm_size" {
  description = "Taille de la machine virtuelle"
  type        = string
  default     = "Standard_B2pts_v2"
}

variable "container_group_name" {
  description = "Nom du groupe de conteneurs"
  type        = string
  default     = "aci-cr460-devoir1"
}

variable "container_name" {
  description = "Nom du conteneur"
  type        = string
  default     = "cr460-web"
}

variable "key_vault_name" {
  description = "Nom du coffre Azure Key Vault"
  type        = string
  default     = "kv-cr460-jkoulei-2026"
}


variable "acr_name" {
  description = "Nom du registre Azure Container Registry"
  type        = string
  default     = "acrcr460jkoulei2026"
}