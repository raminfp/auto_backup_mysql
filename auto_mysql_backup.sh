#!/bin/sh
# 
# 
# Auto BackUp of List Database (MySQL) 

# List of databases
dblist="DB1 DB2"

backupdir=/root/
hotcopycmd="/usr/bin/mysqldump --lock-tables --databases"
echo "Dumping MySQL Databases..."
echo "##########################"
for database in $dblist; do

        backuppath=/root/$database
        mkdir -p "$backuppath"
        $hotcopycmd $database > "$backuppath"/"$database""_"$(date +%Y%m%d%H%M%S).sql
	$hotcopycmd $database | gzip > "$backuppath"/"$database""_"$(date +%Y%m%d%H%M%S).sql.gz
	echo "Dumping $database ..."
	
done

exit 0
