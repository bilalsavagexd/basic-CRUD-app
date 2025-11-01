## Manual Installation
- Install Nodejs locally
- Clone the Repo.
- Install dependencies (npm install)
- Create DB, get DB_URL, add to .env
    - Option#01: Go to Neondb.tech, Create DB, Get DB_URL, Add to .env
    - Option#02: 
        - Install Docker desktop 
        - Run the Command: `docker --name crud-postgres run -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres` 
        - Add `DATABASE_URL="postgres://postgres:mysecretpassword@localhost:5432/postgres"` to .env
- npx prisma migrate dev
- npx prisma generate
- npm run build
- npm run start

## Docker Installation
- Install Docker desktop
- Create a Network: `docker network create crud-network`
- Run Postgres Locally: `docker run --name crud-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 --network crud-network postgres`
- Build the Image: `docker build -t crud-project .`
- Run the Image: `docker run -e DATABASE_URL=postgres://postgres:mysecretpassword@crud-postgres:5432/postgres --network crud-network -p 3000:3000 crud-project`

## Docker Compose Installation
- Install docker, docker-compose
- Run `docker-compose up`
