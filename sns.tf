resource "aws_sns_topic" "alarm_sns" {
  name = "backup-failure-alarm"
}

resource "aws_sns_topic_subscription" "alarm_target" {
  for_each  = toset(local.sns_emails)
  topic_arn = aws_sns_topic.alarm_sns.arn
  protocol  = "email"
  endpoint  = each.value
}