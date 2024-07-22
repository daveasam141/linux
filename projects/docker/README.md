### To install docker on redhat instance 
sudo yum install docker 

### Enable Docker Service 
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service

# Add your user to docker group.
sudo usermod -aG docker $(whoami)

### To login into docker from command line 
sudo docker login (then enter info)

### To pull docker image from docker hub
sudo docker pull (imagename)

### To check docker images on system 
sudo docker image 


######################################

### Down html 
git clone https://github.com/kendops/website.git
mv website html 


### Create Dockerfile 
vi Dockerfile 
### Paste the following:

FROM nginx 
RUN rm -rf /usr/share/nginx/html
COPY html /usr/share/nginx/
EXPOSE 8080

### Write and quit

# Build and Tag an Image from the Dockerfile
sudo docker image build -t davidasam141/dockerpj:v1 

# Push the Docker image to docker hub
sudo docker push davidasam141/webserver:v1

# Open Port 8080 with Firewalld and Run a Container from an Image and Test It Out
sudo docker run -d -p 8080:80 --restart=always --name webserver davidasam141/webserver:v1
sudo docker ps

# Accessing containerized app 
sudo docker container inspect webserver | grep -i ipaddress


############################################
# Build and Tag an Image from the Dockerfile
sudo docker image build -t davidasam141/webdemo:v2 .

# Push the Docker image to docker hub
sudo docker push davidasam141/webdemo:v2

# Open Port 8080 with Firewalld and Run a Container from an Image and Test It Out
sudo docker run -d -p 80:80 --restart=always --name webdemo davidasam141/webdemo:v2

# List images
docker images

# List containers


######################################################## More organized procedure to build and push docker image 
### Stopping and removing all containers 
docker ps -aq | xargs docker stop | xargs docker rm

docker image ls -q | xargs -I {} docker image rm -f {}
docker rmi -f $(docker images -aq)
docker system prune
docker system prune -a

### Make a directory for Docker image and clone from git repo into created directory 
mkdir -p ~/devops/docker-images/webdemo
cd ~/devops/docker-images/webdemo
git clone https://github.com/kendops/website.git
mv website html

### To login into docker 
sudo docker login 

### Create Dockerfile and insert input 
FROM nginx:latest
COPY html/ /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
EOF

### Build Docker image 
sudo docker image build -t (dockerusername)/webdemo:v(version#) .

### Push built image to docker 
sudo docker push (dockerusername)/webdemo:v(version#)

# Build and Tag an Image from the Dockerfile
sudo docker image build -t davidasam141/webdemo:v2 .

# Push the Docker image to docker hub
sudo docker push davidasam141/webdemo:v2

# Open Port 8080 with Firewalld and Run a Container from an Image and Test It Out
sudo docker run -d -p 80:80 --restart=always --name webdemo davidasam141/webdemo:v2

# List images
docker images

# List containers
docker ps

### Check to see if container is running 
Put the Ip of your instance into your web browser. The webpage shold be running.
