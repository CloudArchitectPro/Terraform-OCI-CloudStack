# Input Variables
variable "availability_domain" {
  type        = string
  description = "The availability domain for the instance"
}

variable "boot_volume_size_in_gbs" {
  type        = number
  description = "The size of the boot volume in GB"
}

variable "image_id" {
  type        = string
  description = "The OCID of the image to use for the instance"
}

variable "instance_display_name" {
  type        = string
  description = "The display name for the instance"
}

variable "memory_in_gbs" {
  type        = number
  description = "The amount of memory in GB for the instance"
}

variable "ocpus" {
  type        = number
  description = "The number of OCPUs for the instance"
}

variable "region" {
  type        = string
  description = "The region where the instance will be created"
}

variable "shape" {
  type        = string
  description = "The shape of the instance (e.g., VM.Standard.A1.Flex)"
}

variable "vpus_per_gb_uhp" {
  type        = number
  description = "The VPUs per GB for ultra-high-performance volumes"
}

variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment"
}

variable "fingerprint" {
  type        = string
  description = "The fingerprint for the API key"
}

variable "private_key" {
  type        = string
  description = "The private key for API signing"
  sensitive   = true  # Marks this variable as sensitive
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key for instance access"
}

variable "subnet_id" {
  type        = string
  description = "The OCID of the subnet for the VNIC"
}

variable "tenancy_ocid" {
  type        = string
  description = "The OCID of the tenancy"
}

variable "user_ocid" {
  type        = string
  description = "The OCID of the user calling the API"
}