const express = require('express')
const path = require('path')
const app = express()
const port = 3000

app.use("/static-site", express.static(path.join(__dirname, 'static')));

app.listen(port);