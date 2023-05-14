import boto3
import time
import os

region=os.environ.get('region')
file_name=os.environ.get('file_name')
bucket_name=os.environ.get('bucket_name')
topic_arn=os.environ.get('topic_arn')


clients=['client1','client2','client3']

       
s3 = boto3.connect_s3()
sns = boto3.client('sns')


def getFileUpdateDate(client):
    name=None
    last_modified=None
    file_name=f'{client}/{file_name}'
    bucket=s3.lookup(bucket_name)
    for key in bucket:
        last_modified=key.last_modified
        name=key.name
        if name==file_name:
            return last_modified
    return None
    
def sendAlrm(client):
    sns.publish(
    TopicArn=topic_arn,
    Message=f"backup window missed for {client}",
    Subject='backup alarm')


def lambda_handler(event, context):
    for client in clients:
        current_date =""
        update_date=getFileUpdateDate(client)
        if current_date !=update_date :
            print(f"backup window missed for {client}")
            sendAlrm(client)
        
    
    

