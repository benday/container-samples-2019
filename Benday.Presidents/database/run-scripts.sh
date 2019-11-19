#!/bin/bash

echo "starting to run database scripts..."
cd /initial-scripts
# sqlcmd -i create-presidents-user.sql -o output.txt

set

echo "running sqlcmd command..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -i create-presidents-user.sql -o /tmp/sqllog.txt
# /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "Pa\$\$word" -i create-presidents-user.sql 

echo "sqlcmd command executed"
