resource "aws_sns_topic" "alarm_sns" {
  name = "backup-failure-alarm"
}
