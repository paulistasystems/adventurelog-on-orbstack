# AdventureLog App

This project is designed to run on **macOS** using **OrbStack** for containerization.

## Setup Instructions

### Prerequisites

*   **macOS**: Ensure you have a macOS operating system.
*   **OrbStack**: Install OrbStack from [orbstack.dev](https://orbstack.dev). OrbStack is used for running Docker containers efficiently on macOS.

### Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/paulistasystems/adventurelog-on-orbstack.git
    cd adventurelog-on-orbstack
    ```

2.  **Configure Environment Variables**:
    Create a `.env` file in the root directory of the project based on `.env.example`.
    ```bash
    cp .env.example .env
    ```
    Edit the `.env` file and fill in the necessary values, such as `POSTGRES_PASSWORD`, `SECRET_KEY`, `DJANGO_ADMIN_PASSWORD`, and any other optional services you want to use.

3.  **Start the application with OrbStack (Docker Compose)**:
    ```bash
    docker compose up -d
    ```
    This command will build and start the services defined in `docker-compose.yml` using OrbStack's Docker runtime.

4.  **Access the application**:
    Once the services are up and running, the application should be accessible at [http://localhost:8015](http://localhost:8015) in your web browser.

## Project Structure

*   `.env`: Environment variables for the project (ignored by Git).
*   `.env.example`: Example environment variables.
*   `docker-compose.yml`: Defines the services for the application, including the web frontend, backend server, and PostgreSQL database.
*   `volumes/`: Directory for persistent data (e.g., databases, media files).

---
Enjoy using AdventureLog!
