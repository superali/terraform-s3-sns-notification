resource "aws_cloudwatch_event_rule" "schedule" {
  name                = "schedule"
  description         = "Fires once a day at 11:30 pm"
  schedule_expression = "cron(30 23 * * ? *)"
}

resource "aws_cloudwatch_event_target" "schedule" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  target_id = "lambda"
  arn       = aws_lambda_function.schedule.arn
}
resource "aws_lambda_permission" "allow_cloudwatch_to_call_schedule" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.schedule.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule.arn
} 
