from diagrams import Diagram,Cluster
from diagrams.aws.compute import LambdaFunction
from diagrams.aws.integration import Eventbridge
from diagrams.aws.integration import SimpleNotificationServiceSnsTopic
from diagrams.aws.integration import SimpleNotificationServiceSnsEmailNotification
from diagrams.aws.storage import SimpleStorageServiceS3
from diagrams.aws.management import Cloudwatch

with Diagram("Notification Service", show=True):
    cron_rule = Eventbridge("cron_rule_11:30 PM")

    with Cluster("Lambda-Flow"):
        send_email = SimpleNotificationServiceSnsEmailNotification("3-send_email")

        lambda_func = LambdaFunction("lambda_func")
        cloudwatch_logs = Cloudwatch("cloudwatch_logs")

        invoke_sns_topic =  SimpleNotificationServiceSnsTopic("2-invoke_sns_topic")

        check_backup_file = SimpleStorageServiceS3("1-check_backup_file")
        lambda_func >> [
                     invoke_sns_topic,
                      check_backup_file
                      ] 
        invoke_sns_topic >> send_email 

    cron_rule >> lambda_func >>cloudwatch_logs 

