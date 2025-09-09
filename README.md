# WordPress – Dockerised 🐳
A lightweight and customizable Docker-based setup for running WordPress locally. Includes a MySQL database and persistent volumes for seamless development and testing.

## Project Handover  

📄 [Project Documentation PDF](<./Wordpress Checkliste.pdf>)

---

## Table of Contents  
- [Prerequisites](#prerequisites)  
- [Quickstart](#quickstart)  
- [Usage](#usage)  
- [Me](#me)

---

## Prerequisites  
Before running this project, make sure the following tools are installed on your system:

| Tool            | Version Recommendation | Purpose                              |
|-----------------|------------------------|--------------------------------------|
| [Git](https://git-scm.com/)            | ≥ 2.30                 | Clone the repository                 |
| [Docker](https://www.docker.com/)      | ≥ 24.0                 | Container runtime                    |
| [Docker Compose](https://docs.docker.com/compose/) | ≥ 2.20 | Orchestrate multi-container setup   |

> 💡 Tip: Run `docker -v`, `docker compose version`, and `git --version` to verify your environment.

---

## Quickstart  

1. **Clone the repository**

    ```bash
    git clone https://github.com/Jonathan-Priebe/Minecraft-Server.git
    cd Minecraft-Server
    ```

All key settings are controlled via environment variables and Docker volumes. You can adjust them in the [Docker-Compose](./docker-compose.yml) file.

> ℹ️ To get started, copy the [example environment file](./example.env):
> ```bash
> cp example.env .env
> ```
> Then adjust the values to match your desired setup.

2. **Run Container with Dcoker Compose**

  ```bash
  docker compose up -d
  ```
  - Environment variables are loaded from your .env file

  - You can customize and exposed ports

  - To stop the server:

  ```bash
  docker compose down
  ```

## Usage  

1. **Environment Configuration**

Edit .env to define your WordPress, MySQL settings and Admin Interface in [example.env](example.env)

2. **Access WordPress**

- Once running, access WordPress at:
```bash
http://YOUR_IP_OR_DOMAIN:YOUR_WP_PORT
```

- Admin Interface:
```bash
http://YOUR_IP_OR_DOMAIN:YOUR_WP_PORT/wp-admin
```

## Me  

- Created and maintained by Jonathan 
- 📫 Reach me via GitHub or [LinkedIn](https://www.linkedin.com/in/jonathan-p-34471b1a5/)

