# Docker

- Containers (application layer) vs Images (apps)
- Registry (service providing storage) vs Repository (collection of images with same name but different version)

- docker images
	// list all pulled images

- docker ps -a
	// list all running containers (process status)
	// -a : list all running and stopped containers

- docker pull nginx:latest
	// downloads image from docker hub

- docker run --name nginx -d -p 9000:80 nginx:latest
	// runs image on container
	// --name nginx	: sets container name
	// -d : detaches process from terminal
	// -p 9000:80 : binds container port (nginx default is 80) to localhost port 9000

- docker stop {container}
- docker start {container}

- docker build -t node-app:1.0 .
	// builds an image from the Dockerfile in . (not running yet)
	// -t : sets container name

# Dockerfile

FROM node:19-alpine

COPY package.json /app/
COPY src /app

WORKDIR /app

RUN npm install

CMD ["node", "server.js"]
