variable "instance_name" {
  type        = string
  description = "Name for the Google Compute instance"
}
variable "instance_zone" {
  type        = string
  description = "Zone for the Google Compute instance"
}
variable "instance_type" {
  type        = string
  description = "Disk type of the Google Compute instance"
  default     = "n1-standard-1"
  }
  variable "project_id" {
    type = string
    description = "ID of the Google Cloud Project"
    sensitive = true
  }