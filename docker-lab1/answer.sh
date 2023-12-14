docker network create lab1net
docker volume create lab1data
docker container create --name lab1 --publish 9921:5432 --mount "type=volume,source=lab1data,destination=/var/lib/postgresql/data/" --memory 500m --cpus 0.5 --network lab1net -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=testDB postgres
