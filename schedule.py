import boto3
import time
import os

region=os.environ.get('region')
file_name=os.environ.get('file_name')
bucket_name=os.environ.get('bucket_name')

       
s3 = boto3.connect_s3()

def getFileUpdateDate():
    found=False
    name=None
    last_modified=None
    bucket=s3.lookup(bucket_name)
    for key in bucket:
        last_modified=key.last_modified
        name=key.name
        if name==file_name:
            found=True
            break
    if not found :
        return None
    return last_modified
def sendAlrm():
    pass

def lambda_handler(event, context):
    current_date =""
    update_date=getFileUpdateDate()
    if current_date !=update_date :
        sendAlrm()
        print("backup window missed")
        
    
    

