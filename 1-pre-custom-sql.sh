#!/bin/sh

if [[ -z $MARIADB_PRE_CUSTOM_SQL ]]; then
    echo "Undefined MARIADB_PRE_CUSTOM_SQL environment variable. No action will be taken!"
else
    echo "Executing SQL: '$MARIADB_PRE_CUSTOM_SQL'"
    mysql -uroot -p$MARIADB_ROOT_PASSWORD -e "$MARIADB_PRE_CUSTOM_SQL"
fi