# create mysql container
docker container create --name mysqldb --publish 9901:3306 -e MYSQL_ROOT_PASSWORD=r00t@Password -e MYSQL_DATABASE=mydb -e MYSQL_USER=node -e MYSQL_PASSWORD=node123 mysql

