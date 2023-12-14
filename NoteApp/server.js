const express = require("express");
const app = express();
const appController = require("./controller/appController");

//MIDDLEWARE
app.use(express.json());

//ROUTES
app.get('/', appController.home);

app.post("/notes", appController.createNote);

app.get("/notes", appController.getAllNotes);

app.get("/notes/:id", appController.getOneNote);

app.put("/notes/:id", appController.updateOneNote);

app.delete("/notes/:id", appController.deleteOneNote);

//PORT
const port = process.env.APP_PORT;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})