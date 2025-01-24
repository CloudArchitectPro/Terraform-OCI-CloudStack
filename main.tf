# Configure the OCI Provider
provider "oci" {
  tenancy_ocid = var.tenancy_ocid     # OCID of your tenancy
  user_ocid    = var.user_ocid        # OCID of the user calling the API
  fingerprint  = var.fingerprint      # Fingerprint for the key pair
  private_key  = var.private_key      # Private key for API signing
  region       = var.region           # Region where resources will be created
}

# Create an OCI Compute Instance
resource "oci_core_instance" "nuvatron_instance" {
  availability_domain = var.availability_domain  # Availability domain for the instance
  compartment_id      = var.compartment_id       # Compartment OCID
  display_name        = var.instance_display_name # Display name for the instance
  shape               = var.shape                # Shape of the instance (e.g., VM.Standard.A1.Flex)

  # Shape Configuration (for flexible shapes)
  shape_config {
    ocpus         = var.ocpus          # Number of OCPUs
    memory_in_gbs = var.memory_in_gbs  # Amount of memory in GB
  }

  # Configure the Virtual NIC (VNIC)
  create_vnic_details {
    subnet_id        = var.subnet_id   # Subnet OCID for the VNIC
    assign_public_ip = true            # Assign a public IP to the instance
  }

  # Source Details (Boot Volume and Image)
  source_details {
    source_type             = "image"  # Source type (image or boot volume)
    source_id               = var.image_id  # OCID of the image
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs  # Size of the boot volume in GB
  }

  # Metadata for SSH Access
  metadata = {
    ssh_authorized_keys = var.ssh_public_key  # SSH public key for instance access
  }
}

# Outputs
output "public_ip" {
  value       = oci_core_instance.nuvatron_instance.public_ip
  description = "The public IP address of the instance"
}

output "private_ip" {
  value       = oci_core_instance.nuvatron_instance.private_ip
  description = "The private IP address of the instance"
}

output "availability_domain" {
  value       = oci_core_instance.nuvatron_instance.availability_domain
  description = "The availability domain of the instance"
}

output "display_name" {
  value       = oci_core_instance.nuvatron_instance.display_name
  description = "The display name of the instance"
}

output "shape" {
  value       = oci_core_instance.nuvatron_instance.shape
  description = "The shape of the instance"
}

output "state" {
  value       = oci_core_instance.nuvatron_instance.state
  description = "The current state of the instance"
}

output "formatted_date" {
  value       = formatdate("DD MMM YYYY", timestamp())
  description = "The current date formatted as day, month, and year"
}

output "memory_in_gbs" {
  value       = oci_core_instance.nuvatron_instance.shape_config[0].memory_in_gbs
  description = "The amount of memory in GBs"
}

output "ocpus" {
  value       = oci_core_instance.nuvatron_instance.shape_config[0].ocpus
  description = "The number of OCPUs"
}