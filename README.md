## Manual Installation
- Install Nodejs locally
- Clone the Repo.
- Install dependencies (npm install)
- Create DB, get DB_URL, add to .env
    - Option#01: Go to Neondb.tech, Create DB, Get DB_URL, Add to .env
    - Option#02: 
        - Install Docker desktop 
        - docker run -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres 
        - Add `DATABASE_URL="postgres://postgres:mysecretpassword@localhost:5432/postgres" to .env`
- npx prisma migrate dev
- npx prisma generate
- npm run build
- npm run start

## Docker Installation
- Install Docker desktop
- If you went with `Option#02` then Run Command: `docker run -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 postgres`
- Build the Image: `docker build -t crud-project .`
- Run the Image: `docker run -p 3000:3000 crud-project .`