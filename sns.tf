resource "aws_sns_topic" "alarm_sns" {
  name = "backup-failure-alarm"
}

resource "aws_sns_topic_subscription" "alarm_target" {
  count=   length(local.sns_emails)
  topic_arn = aws_sns_topic.alarm_sns.arn
  protocol  = "email"
  endpoint  = local.sns_emails[count.index] 
}