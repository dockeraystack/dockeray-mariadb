#!/bin/sh

mysql -uroot -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES; GRANT RELOAD ON *.* TO '$MARIADB_USER'@'%'"