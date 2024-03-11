import cors from "cors";
import express from "express";

initServer();

export default function initServer() {
  const app = express();

  app.use(cors());

  app.get("/health", function (req, res) {
    console.log("/health");
    const random = Math.random() * 100;
    res.status(200).send(`ok ${random}`);
  });

  app.listen(9001, () => {
    console.log(`🌏 Server is listening as http on port 9001`);
  });
}
