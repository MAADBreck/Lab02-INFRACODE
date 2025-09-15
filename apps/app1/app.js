const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || "0.0.0.0";

app.get("/", (req, res) => {
  res.send("Hola, soy la APP1 corriendo en Docker 🚀");
});

app.listen(PORT, HOST, () => {
  console.log(`APP1 escuchando en http://${HOST}:${PORT}`);
});
