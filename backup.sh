#! /bin/bash

# backup of postgresql databases
# by alexandru bran;



#cd to utils folder
cd /utils

#export password file ??? check why this needs to be done each time ???
export PGPASSFILE='.pgpass'

#check if VM has enough space to backup databases

#check if s3cmd has enough space to get the uploads


#dump tacdb => whole database
pg_dump -U postgres  -h localhost tacdb  >   gzip > tacdb.gz

#dump npt tables
pg_dump -U postgres  -h localhost npt  >   gzip > npt.gz

#dump syntheseTools
pg_dump -U postgres  -h localhost syntheseTools  >   gzip > syntheseTools.gz

#dump ecosystem database
pg_dump -U postgres  -h localhost ecosystem >   gzip > ecosystem.gz

echo "done dumping the databases!"

#transfer backups to s3
s3cmd put tacdb.gz s3://backup
s3cmd put npt.gz  s3://backup
s3cmd put syntheseTools.gz s3://backup
s3cmd put ecosystem.gz s3://backup

echo "done uploading to s3!"

#delete older backups


#send report about activity

#done

