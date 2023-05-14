resource "aws_s3_bucket" "backup" {
  bucket = "daysum-sql-backup"
}

resource "null_resource" "generate_backup" {

  provisioner "local-exec" {

    command = "/bin/bash s3.sh"
    environment = {
      BACKUP_LOG_CHANNEL        = "stack"
      BACKUP_BROADCAST_DRIVER   = "log"
      BACKUP_AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
      BACKUP_AWS_BUCKET         = aws_s3_bucket.backup.bucket
      BACKUP_FILE_NAME          =var.BACKUP_FILE_NAME
    }
  }
  triggers = {
    always_run = "${timestamp()}"
  }

}
