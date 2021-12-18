const mysql = require('mysql');
var mysqlconnection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "hsenid",
    multipleStatements : true
}) ;

mysqlconnection.connect((err)=>{
    if(!err){
        console.log("connect");
    }
    else{
        console.log(err);
    }
})


module.exports = mysqlconnection;