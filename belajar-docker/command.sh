# download images
# docker pull <publisher>/<image>:<tag>
docker pull nginx

# melihat images yang tersedia pada lokal
docker images

# menghapus docker image pada lokal
# docker image rm <publisher>/<image>:<tag>
docker image rm nginx

# menjalankan aplikasi dalam kontainer dari image yang tersedia
docker container create --name nginx-webserver nginx:latest
docker container create --name nginx-webserver2 nginx:latest

# melihat semua container
docker container ls -a

# menjalankan container
# docker container start <container-name>
docker container start nginx-webserver

# melihat container yang sedang berjalan
docker container ls

# menghentikan container yang sedang berjalan
docker container stop nginx-webserver

# menghapus container
docker container rm nginx-webserver

# melakukan log dari container
docker container logs nginx-webserver

# masuk kedalam container
# docker container exec -i -t <container-name> bash
docker container exec -i -t nginx-webserver bash

# membuat container dan menghubungkan port host dan aplikasi
# docker container create --name <container-name> --publish <port-host>:<port-docker> <image-name>
docker container create --name nginx-webserver --publish 8080:80 nginx:latest

# menggunakan container variable
docker container create -i -t --name simpleapp -e APP_NAME=SimpleApp alpine
docker container start -i simpleapp
> echo $APP_NAME

# menambahkan resource limit
docker container create --name nginx-webserver --memory 100m --cpus 0.5 nginx:latest

# menambahkan network
# docker network create <network-name>
docker network create appnet

# melihat network
docker network ls

# menghapus network
# docker network rm <network-name>
docker network rm appnet

# menambahkan network kedalam container yang sudah terbuat
# docker network connect <network_name> <container_name_or_id>
docker network connect appnet nginx-webserver

# membuat container dengan network
docker container create --name simple-alpine --network appnet alpine

# check network mana saja yang terhubung dalam satu container
# docker inspect --format='{{range .NetworkSettings.Networks}}{{.Network}}{{end}}' <container_name_or_id>
docker inspect --format='{{range .NetworkSettings.Networks}}{{.Network}}{{end}}' simple-alpine

# docker mount
# --mount "type=<mount-type>,source=<storage-src>,destination=<storage-dest>"
# bind
mkdir pgdata
docker container create --name postgres-db --publish 5432:5432 --mount "type=bind,source=./pgdata,destination=/var/lib/postgresql/data/" -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=mydb postgres
# volume
docker volume create pgdata
docker container create --name postgres-db --publish 5432:5432 --mount "type=volume,source=pgdata,destination=/var/lib/postgresql/data/" -e POSTGRES_USER=dbadmin -e POSTGRES_PASSWORD=admin123 -e POSTGRES_DB=mydb postgres