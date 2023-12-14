# create postgres container
docker container create --name postgres-db --publish 9997:5432 -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=mydbs postgres

# create postgres with init 
docker container create --name postgres-db --publish 9997:5432 -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=mydb -v ./dbpostgres/db_init.sql:/docker-entrypoint-initdb.d/init.sql postgres

# create postgres with init and network but not publish to host port
docker container create --name postgres-db --network appnet -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=mydb -v ./dbpostgres/db_init.sql:/docker-entrypoint-initdb.d/init.sql postgres