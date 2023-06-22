#!/bin/bash

export PGPASSWORD="passwd"

declare -a arr=("db1" "db2" "db3")

## now loop through the above array
for db in "${arr[@]}"
do
   echo "*************************************"
   echo "$db"
   echo "*************************************"
   
   pg_restore -h <new-db-url> -U postgres -v -F t -d $db $db-data.tar
done

