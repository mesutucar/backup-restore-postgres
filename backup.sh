#!/bin/bash

export PGPASSWORD="passwd"

declare -a arr=("db1" "db2" "db3")

## now loop through the above array
for db in "${arr[@]}"
do
   echo "*************************************"
   echo "$db"
   echo "*************************************"

   pg_dump -h <old-db-url> -U postgres --data-only -v -F t -d $db -f $db-data.tar
done

