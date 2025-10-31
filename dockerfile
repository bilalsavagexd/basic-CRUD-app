# Base-layer (Always start with this)
FROM    node:20-alpine

WORKDIR /app

COPY ./packages.json    ./package.json
COPY ./package-lock.json    ./package-lock.json

RUN npm install

COPY .  .

ENV DATABASE_URL=postgres://postgres:mysecretpassword@localhost:5432/postgres

RUN npx prisma migrate dev
RUN npx prisma generate
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
