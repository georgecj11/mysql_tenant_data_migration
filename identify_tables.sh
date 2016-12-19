#!/bin/bash
password=root
username=root

dump_folder=dumps
org_id=1447
mkdir -p $dump_folder/data
mysql -p$password -u $username -e "show databases" > db_name.txt

for db_name in `cat db_name.txt`; do 
	mysql -p$password -u $username -e "select table_schema, table_name, column_name from information_schema.columns where column_name in ('org_id', 'publisher_id') and table_name not in ('Temp', 'tempdb', 'data_cleanup', 'performance_logs') and TABLE_SCHEMA = '$db_name'" > $dump_folder/tables.txt;
	for tbl_name in `cat tables.txt`; do
		echo "mysqldump -p $password -u $username $dbname $tbl_name --no-create-info --compact --skip-comments --skip-utc --skip-lock-tables --where 'org_id=1447' " >> $dump_folder/data/"$db_name"_dump.sh
	done;
done;
