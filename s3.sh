#!/bin/bash
printenv | grep '^BACKUP_'  >"env_file"   
cat "env_file" | sed 's/^........//' |sort > "${BACKUP_FILE_NAME}"

aws s3 cp "${BACKUP_FILE_NAME}"  s3://"${BACKUP_AWS_BUCKET}/client1/${BACKUP_FILE_NAME}"
aws s3 cp "${BACKUP_FILE_NAME}"  s3://"${BACKUP_AWS_BUCKET}/client2/${BACKUP_FILE_NAME}"
aws s3 cp "${BACKUP_FILE_NAME}"  s3://"${BACKUP_AWS_BUCKET}/client3/${BACKUP_FILE_NAME}"
