variable "project_id" {
    type = string
    description = "ID of the Google Cloud Project"
    sensitive = true
  }

variable "db_password" {
  type        = string
  description = "Password of the Database"
  sensitive = true
}

