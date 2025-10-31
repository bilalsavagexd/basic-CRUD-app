# Base-layer (Always start with this)
FROM    node:20-alpine

WORKDIR /app

COPY ./package.json    ./package.json
COPY ./package-lock.json    ./package-lock.json

RUN npm install

COPY .  .

# Since this project will be run locally I can just add the URL here, 
# so the user doesn't have to
ENV DATABASE_URL=postgres://postgres:mysecretpassword@localhost:5432/postgres

RUN npx prisma migrate dev
RUN npx prisma generate
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
