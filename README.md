*This project has been created as part of the 42 curriculum by zayaz.*

## Description
This project aims to broaden knowledge of system administration by using Docker. It involves setting up a small infrastructure composed of different services in a virtual machine using docker-compose.

The infrastructure consists of:
- An NGINX container with TLSv1.2 or TLSv1.3 only
- A WordPress + php-fpm container
- A MariaDB container
- Two Docker named volumes (for the database and website files)
- A Docker network connecting all containers

## Instructions
### Prerequisites
- A virtual machine
- Docker and Docker Compose installed

### Execution
1. Clone the repository
2.Create and configure the .env file at the root directory with the required credentials.
3. Run `make` to build and start the infrastructure

## Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [WordPress with PHP-FPM](https://wordpress.org/support/article/php-fpm/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)

### AI Usage
AI was used for debugging Dockerfiles and understanding Docker Compose syntax. All AI-generated content was reviewed and tested.

### Project Description
#### Virtual Machines vs Docker
VMs virtualize hardware while Docker containers virtualize the OS kernel, making containers lighter and faster.

#### Docker Secrets vs Environment Variables
This project utilizes an .env file to manage environment variables for general configuration (e.g., DOMAIN_NAME). While environment variables are convenient, Docker Secrets are used for highly sensitive data like database passwords. Unlike env vars, secrets are not stored in the image or visible via docker inspect; they are mounted as temporary files in memory, providing a higher level of security.

#### Docker Network vs Host Network
Docker Network provides isolation between containers. Host network is forbidden by the subject.

#### Docker Volumes vs Bind Mounts
Named volumes are managed by Docker and stored in `/home/zayaz/data`. Bind mounts depend on host directory structure.