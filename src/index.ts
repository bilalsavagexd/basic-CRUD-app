import express from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
const app = express();

app.post("/", async (req, res) => {
    await prisma.user.create({
        data: {
            username: Math.random().toString(),
            password: Math.random().toString()
        }
    });
    res.json({
        "message": "POST endpoint"
    })
});

app.get("/", async (req, res) => {
    const data = await prisma.user.findMany();
    res.json({ 
        data 
    });
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
