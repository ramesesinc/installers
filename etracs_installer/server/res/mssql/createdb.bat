sqlcmd -S @apphost -U @dbuser -P @dbpwd -i temp/etracs25db.sql
sqlcmd -S @apphost -U @dbuser -P @dbpwd -i temp/notificationdb.sql
sqlcmd -S @apphost -U @dbuser -P @dbpwd -i temp/populate-tables.sql
sqlcmd -S @apphost -U @dbuser -P @dbpwd -i temp/update-tables.sql
