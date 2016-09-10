#!/bin/sh
# 
# 
# Auto BackUp of List Database (MySQL) 

# List of databases
dblist="DB1 DB2"

backupdir=/root/


hotcopycmd="/usr/bin/mysqldump --lock-tables --databases"

echo "Dumping MySQL Databases..."
RC=0

for database in $dblist; do

        backuppath=/root/$database
        mkdir -p "$backuppath"
        $hotcopycmd $database > "$backuppath"/"$database""_"$(date +%Y%m%d%H%M%S).sql
		echo "Dumping $database ..."
done

if [ $RC -gt 0 ]; then
   echo "MySQL Dump failed!"
   exit $RC
else
   ls -l "$backupdir"
   echo "MySQL Dump is complete!"
fi
exit 0