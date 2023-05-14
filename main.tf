## ---------------------------------------------------------------------------------------------------------------------
## BACKUP NOTIFICATION SYSTEM
## This project create a workflow that send email notification if at least one client backup file is not updated daily 
## This project contains the following component:
## sns topic : it sends emails to pre-defined subsciber
## lambda function : it checks backup file last update date on s3 and invoke sns topic accordingly
## event bridge : it invokes lambda function every day at 11:30 pm
## cloud watch : it stores logs from lambda function
## s3 : create an s3 bucket and then use null provisioner to upload demo backup files
## Assumptions :
## This code uses demo backup files genereted by s3.sh bash file ,this should be modified to fit real production use cases
## ---------------------------------------------------------------------------------------------------------------------