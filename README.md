# Eventora - Event Management System

**Event Management System** is a project designed to plan, organize, and manage events efficiently. It helps users handle event details, schedules, registrations, and payments in one place, saving time and reducing manual work.

## Team Members
- Member 1: H.C.Jayangi Wickramarathna - ID: ITBIN-2313-0125
- Member 2: S.M.K.S De Silva - ID: ITBIN-2313-0020

## Roles
- Member 1: DevOps (CI/CD setup, workflow automation, Docker containerization)
- Member 2: UI/Frontend (HTML, CSS, forms, pages)

## Live URL
- https://capable-jalebi-8d1d71.netlify.app/

## Running with Docker

### Prerequisites
- [Docker Engine](https://docs.docker.com/engine/install/) 20.10 or later
- [Docker Compose](https://docs.docker.com/compose/install/) v2 or later
- Git (to clone the repository)

### 1. Clone the repository
```bash
git clone https://github.com/Jayangi2001/Eventora-Event-management-system.git
cd Eventora-Event-management-system
```

### 2. Build and run with Docker Compose (recommended)
```bash
docker-compose up --build
```
This builds the image from the `Dockerfile` and starts the container as defined in `docker-compose.yml`.

### 3. Access the application
Once running, open:
```
http://localhost:8080
```

### 4. Stop the application
```bash
docker-compose down
```

### Alternative: Build and run with plain Docker (without Compose)
```bash
docker build -t eventora .
docker run -d -p 8080:8080 --name eventora-web eventora
```

### Configuration
This is a static front-end application (HTML/CSS/JS) served by nginx. There are no environment variables, databases, or external services required to run it.

- The container listens internally on port **8080** (runs as a non-root `nginx` user, so it cannot bind to privileged port 80).
- Port 8080 on the host is mapped to port 8080 in the container via `docker-compose.yml`.
- A Docker `HEALTHCHECK` is configured to verify the nginx process is responding.
- Resource limits (0.5 CPU / 128MB memory) are set in `docker-compose.yml` to prevent unbounded resource usage.

### Troubleshooting
| Issue | Solution |
|---|---|
| Port 8080 already in use | Change the host port in `docker-compose.yml`, e.g. `"8081:8080"` |
| `docker-compose` command not found | Use `docker compose` (no hyphen) if using Docker Compose v2 plugin |
| Container exits immediately | Run `docker logs eventora-web` to inspect the error |

## Project Structure
```
.
├── Dockerfile              # Container build definition
├── docker-compose.yml      # Service orchestration
├── .dockerignore           # Files excluded from build context
├── index.html               # Landing page
├── home.html
├── events.html
├── contact.html
├── create.html
├── style.css
└── .github/workflows/       # CI/CD pipelines (ci.yml, deploy.yml)
```

## Contributions
- Member 1:
  - Created CI/CD workflows (ci.yml, deploy.yml)
  - Docker containerization (Dockerfile, docker-compose.yml)
  - Deployment preparation
  - Merged feature branches into develop
- Member 2:
  - Developed UI pages (home.html, events.html, contact.html, create.html)
  - Added forms and styling (style.css)
  - Added UI features and tested responsiveness

