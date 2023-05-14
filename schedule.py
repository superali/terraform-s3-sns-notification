import boto3
import time
import os

region=os.environ.get('region')
file_name=os.environ.get('file_name')
bucket_name=os.environ.get('bucket_name')
topic_arn=os.environ.get('topic_arn')


clients=['client1','client2','client3']

       
# s3 = boto3.connect_s3()
sns = boto3.client('sns')
from datetime import datetime, timezone

today = datetime.now(timezone.utc).date()

s3 = boto3.client('s3', region_name=region)


        
        

def getFileUpdateDate(client,file_name):
    name=None
    last_modified=None
    file_path=f'{client}/{file_name}'
    
    objects = s3.list_objects_v2(Bucket=bucket_name,Prefix=file_path)
    
    if len(objects["Contents"])==0: 
        return None
    return objects["Contents"][0].get('LastModified').date()

def sendAlrm(client):
    sns.publish(
    TopicArn=topic_arn,
    Message=f"backup window missed for {client}",
    Subject='backup alarm')


def lambda_handler(event, context):
    for client in clients:
        update_date=getFileUpdateDate(client,file_name)
        if update_date is None or today ==update_date :
            print(f"backup window missed for {client}")
            sendAlrm(client)
        else:
            print(f"backup succeeded for {client}")
        
    
    

