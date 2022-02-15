#!/bin/bash

#Before running this script verify that all necessary AWS configuration has been completed. This includes 
#creation of EC2 Instance (Ubuntu recommended), EC2 access keys, S3 Bucket, S3 bucket policies, and a public access point.  

#CONNECT TO YOUR EC2 INSTANCE
#ssh -i *YOUR PEM FILE* ec2-user@*YOUR EC2 ADDRESS*

cd ~ && wget -O- "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#downloads Dropbox to the EC2 instance

~/.dropbox-dist/dropboxd
#this will output a message prompting you to authenticate
#to your desired Dropbox account. 

sudo apt install awscli
#Ubuntu instances

aws s3 sync ~/Dropbox s3://**YOUR-S3-URI**/Dropbox
#this will run the aws sync command which will connect and push data 
#from Dropbox into your S3 bucket at the subdirectory /Dropbox 
