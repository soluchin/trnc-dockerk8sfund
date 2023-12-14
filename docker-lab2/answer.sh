docker build -t lab2img
docker container create --name lab2app --publish 8080:8081 lab2img
docker container start lab2app
curl localhost:8080