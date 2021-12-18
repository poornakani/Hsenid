const mysql = require('mysql');
const express = require("express");
const bodyParser = require("body-parser");
const path = require('path');

const transaction = require("./routes/transaction");
const user= require("./routes/Users")


var app = express();
app.use(bodyParser.json());


app.use("/trans",transaction);
app.use("/user",user);

app.listen(3302);