const express = require("express");
const mysqlConnection = require("../connection");
const Router = express.Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

Router.post('/UserSign',function (req, res) {
    var user = req.body.Username;
    var password =  req.body.Password;
    var validation = false;
    var useravalable="no";
    ////////////////validation
    mysqlConnection.query("SELECT Username  FROM userdetails WHERE Username ='"+user+"'", function (err,result) {
        if(err){
            console.log(err);
        }
        else {
            var passwordHas =  req.body.Password;
            bcrypt.hash(passwordHas, 10, (err, hash) => {
                if (err) {
                    return res.status(500).json({
                        error: err
                    });
                } else {
                    mysqlConnection.query(")", function (err, result) {
                        if (err) {
                            console.log(err);
                        } else {
                            console.log("one record added");
                        }
                    });
                }
            })
        }

    });

});

///////login


module.exports =Router;