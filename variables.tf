## ---------------------------------------------------------------------------------------------------------------------
## ENVIRONMENT VARIABLES
## Define these variables as environment variables
## ---------------------------------------------------------------------------------------------------------------------


variable "AWS_DEFAULT_REGION" {
  type = string

  default = "us-east-1"
}
variable "LOG_GROUP_RETENTION_DAYS" {
  type    = number
  default = 7
}

variable "AWS_ACCESS_KEY_ID" {
  type = string

}
variable "AWS_SECRET_ACCESS_KEY" {
  type = string

}
variable "BACKUP_FILE_NAME" {
  type    = string
  default = "backup.sql"

}
