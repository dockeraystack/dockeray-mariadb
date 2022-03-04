# dockeray-mariadb
Docker container used to run MariaDB as the database for the Dockeray Stack

Docker Compose usage

```
 dba:
    container_name: dba.mydomain.com
    entrypoint: ["dockerize", "-wait", "file:///docker-entrypoint-initdb.d/dump.sql.gz", "-timeout", "2m", "docker-entrypoint.sh"]
    command: ["mariadbd"]
    environment:
      - MARIADB_ROOT_PASSWORD=mycustomrootpassword
      - MARIADB_ONETIME_PASSWORD=true
      - MARIADB_DATABASE=lportal
      - MARIADB_USER=mycustomuser
      - MARIADB_PASSWORD=mycustomuserpassword
    pid: host
    privileged: true
    restart: on-failure
    image: dockeraystack/dockeray-mariadb:10.3.17-1.0.1
    hostname: dba
    domainname: mydomain.com
    depends_on:
      - rst
    volumes:
      - restore:/docker-entrypoint-initdb.d/
    networks:
      - backend
```