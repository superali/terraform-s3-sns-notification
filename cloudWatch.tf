resource "aws_cloudwatch_log_group" "schedule" {
  name              = "/aws/lambda/schedule"
  retention_in_days = var.LOG_GROUP_RETENTION_DAYS

}