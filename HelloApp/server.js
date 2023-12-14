const express = require("express");
const app = express();
const path = require('path');

//MIDDLEWARE
app.use(express.json());

//ROUTES
app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, '/index.html'));
});

//PORT
const port = process.env.APP_PORT || 8080;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})