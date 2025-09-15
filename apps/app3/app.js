const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || "0.0.0.0";  // << importante

app.get("/", (req, res) => {
  res.send("Hola, soy la APP3 corriendo en Docker 🚀"); // cambia APP1/2/3
});

app.listen(PORT, HOST, () => {
  console.log(`APP1 escuchando en http://${HOST}:${PORT}`);
});
