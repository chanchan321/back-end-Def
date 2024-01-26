const db = require('../middleware/myDB');
const bcrypt = require('bcrypt');
const crypto = require("crypto");


const getlongEvents = async (req, res) => {
            const sqlgetApp= "SELECT * FROM longevents";
            db.query(sqlgetApp,(err,result)=>{
                if(err) return res.sendStatus(500)
                res.send(result)
        })
  
}


const postlongEvents = async (req, res) => {
        const reqID = crypto.randomBytes(12).toString("hex");
        const {typeOfevent,description,start,end} = req.body
        const sqlgetApp= "INSERT INTO `longevents`(`eventID`, `title`, `start`, `end`, `description`) VALUES (?,?,?,?,?)";
        db.query(sqlgetApp,[reqID,typeOfevent,start,end,description],(err,result)=>{
            if(err) return res.sendStatus(500)
            res.send(result)
    }) 
  
}

const editlongEvents = async (req, res) => {
        const {id,title,description} = req.body
        const sqlgetApp= "UPDATE longevents SET title = ?, description = ? WHERE eventID = ?";
        db.query(sqlgetApp,[title,description,id],(err,result)=>{
            if(err) return res.sendStatus(500)
            res.send(result)
    }) 
}

const deletelongEvents = async (req, res) => {
        const {id} = req.params
        const sqlgetApp= "DELETE FROM longevents WHERE eventID = ?";
        db.query(sqlgetApp,[id],(err,result)=>{
            if(err) return res.sendStatus(500)
            res.send(result)
    }) 
}



module.exports = {
    getlongEvents,
    postlongEvents,
    editlongEvents,
    deletelongEvents

}
