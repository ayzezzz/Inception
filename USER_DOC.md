# User Documentation

## Services Provided
The infrastructure provides the following services:
- **NGINX**: A secure web server acting as the only entry point via port 443 using TLSv1.2 or TLSv1.3.
- **WordPress**: A website engine powered by php-fpm.
- **MariaDB**: A dedicated relational database management system.
## Start and Stop the Project
You can manage the project using the following commands from the root directory:
- **Start**: Run `make` to build and launch all services.
- **Stop**: Run `make stop` to halt the containers.
- **Clean**: Run `make fclean` to remove containers, networks, and all persistent data (volumes).

## Access the Website and Admin Panel
- **Main Website**: Access the site via [https://zayaz.42.fr](https://zayaz.42.fr).
- **Administration Panel**: Access the WordPress dashboard at [https://zayaz.42.fr/wp-admin](https://zayaz.42.fr/wp-admin) to manage the website.

## Credentials and Security
For security reasons, sensitive credentials are managed centrally:
- **Location**: All passwords and keys are stored within the .env file at the project root.
- **Management**: To change or locate credentials, refer to the .env file directly.
- **WordPress Admin**: The administrator account is created during setup. Its username does not contain "admin" or "administrator" for security.

## Check Service Status
To verify that all services are running correctly, use the following command:
```bash
docker ps
```