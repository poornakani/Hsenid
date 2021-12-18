const express = require("express");
const mysqlConnection = require("../connection");
const Router = express.Router();

Router.get('/',function (req, res) {

    mysqlConnection.query("SELECT * FROM transcation_hsenid  ORDER BY createDate DESC", (err,rows, fields)=>{
        if(!err){
            res.send(rows);
        }
        else {
            console.log(err);
            res.send(err);
        }

    })

});

Router.post('/addTrans',function (req, res) {
    var id = req.body.id;
    var ti =  req.body.title;
    var amou = req.body.amount;
    var da = req.body.date;
    var creda = req.body.createDate;


    console.log(id,ti,amou,da,creda);
    //console.log("poorna kanishka")
    mysqlConnection.query("INSERT INTO transcation_hsenid (id, title, amount, date, createDate) VALUES ('"+id+"' ,'"+ti+"','"+amou+"','"+da+"','"+creda+"')", function (err,result) {
        if(err){
            console.log(err);
        }
        else{
            console.log("one record added");
        }
    });

});

////////////////////////////delete data
    Router.delete('/delete',function (req, res){
        var deleteID = req.body.id
        mysqlConnection.query("DELETE FROM transcation_hsenid WHERE  id = '"+deleteID+"'", (err,rows, fields)=>{
            if(!err){
                res.send(rows);
                console.log("one raw was deleted");
            }
            else {
                console.log(err);
                res.send(err);
            }
        })
    });

module.exports =Router;