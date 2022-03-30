#!/bin/sh

if [[ -z $MARIADB_POST_CUSTOM_SQL ]]; then
    echo "Undefined MARIADB_POST_CUSTOM_SQL environment variable. No action will be taken!"
else
    echo "Executing SQL: '$MARIADB_POST_CUSTOM_SQL'"
    mysql -uroot -p$MARIADB_ROOT_PASSWORD -e "$MARIADB_POST_CUSTOM_SQL"
fi