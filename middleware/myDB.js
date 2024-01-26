const mysql = require("mysql");

const db = mysql.createConnection({
    host:'b9h7tah1revxhqmyhmbh-mysql.services.clever-cloud.com',
    user:'uobtmqjgkbzlnmaz',
    password:'L3aLEBpgYGUGoxpy1hdo',
    database:'b9h7tah1revxhqmyhmbh'
});



module.exports =  db
