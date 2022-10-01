# Fortify Project

This is the Fortify Project made for Hardhat Enterprises in Deakin University's Capstone Program.

## About

The Hardhat Enterprises Fortify project is a website platform that connects security cohorts and organisations together to provide help and even information about security. The front-end runs on React for its technology stack due to the numerous benefits it can offer. A domain name has been registered and an SSL certificate has been procured to be prepared for when the project is decided to be rolled out into production or even developed into a proof-of-concept functional website.

## Installation

Requires Docker and Docker-compose.
Other requirements are downloaded during deployment.

```
# Clone the repo.
~$ git clone https://github.com/Bnjon01/fortify-dev
~$ cd fortify-dev

# Begin the installation script
~$ docker-compose up

# Open a browser and enter
localhost:3000
```

## Project Structure
### Front end
Below is the current high-level structure of the front-end of the project.

`public` – Public web documents including the default html document.<br />
`src` – React application objects that needs to be reference internally within the React application.<br />
`src/bootstrap` – The bootstrap javascript for additional stylish components.<br />
`src/cert` – The SSL certificate, private key, and the chain certificate for the website.<br />
`src/components` – Some of the function components including Navbar, Footer, and the Keycloak authentication.<br />
`src/css` – External cascading stylesheets used for the website.<br />
`src/helpers` – Additional function for authentication.<br />
`src/img` – Images used for the website.<br />
`src/pages` – Individual page components of the website.<br />

### Back end
`django` – Website framework<br />
`node` – JavaScript for server-side functions<br />
`prostgresql` – Database files<br />
`pgadmin` – Development platform for PostgreSQL<br />
