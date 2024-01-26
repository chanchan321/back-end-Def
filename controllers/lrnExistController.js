const db = require('../middleware/myDB');
const bcrypt = require('bcrypt');
const crypto = require("crypto");


const getAllLrn = async (req, res) => {
        const user = req.params.user
        const getSQL = `SELECT * FROM accounts where username = ?`
        db.query(getSQL,[user],(err,result)=>{ 
            res.send(result)
        })
    
}

module.exports = {
    getAllLrn
}
