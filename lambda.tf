data "archive_file" "schedule" {
  type        = "zip"
  source_file = "schedule.py"
  output_path = "schedule.zip"
}

resource "aws_lambda_function" "schedule" {
  function_name    = "schedule"
  role             = aws_iam_role.schedule.arn
  filename         = data.archive_file.schedule.output_path
  source_code_hash = data.archive_file.schedule.output_base64sha256
  handler          = "schedule.lambda_handler"
  timeout          = "300"

  runtime = "python3.9"

  environment {
    variables = {
      region      = var.AWS_DEFAULT_REGION
      file_name   = var.BACKUP_FILE_NAME
      bucket_name = aws_s3_bucket.backup.bucket
      topic_arn   = aws_sns_topic.alarm_sns.arn
    }
  }



  depends_on = [
    aws_iam_role_policy_attachment.schedule-AmazonS3FullAccess,
    aws_iam_role_policy_attachment.schedule_logging,
    aws_cloudwatch_log_group.schedule,
  ]
}

