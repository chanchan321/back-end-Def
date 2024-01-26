const db = require('../middleware/myDB');
const bcrypt = require('bcrypt');
const crypto = require("crypto");

const deleteAcc = async (req, res) => {

        const {lrn,accountID,pisID} = req.params

        const sqldelete1= `DELETE FROM accounts WHERE accountID = ?`

        db.query(sqldelete1,accountID, (err,result)=>{
            if(err) return res.sendStatus(500)
           
            const sqldelete2= `DELETE FROM studpis WHERE accountID = ?`

            db.query(sqldelete2,accountID, (err,result)=>{
                if(err) return res.sendStatus(500)

                const sqldelete3= `DELETE FROM piscontent WHERE pisID = ?`

                db.query(sqldelete3,pisID, (err,result)=>{
                    if(err) return res.sendStatus(500)
                    res.sendStatus(200);
                    
                })  
                
            })  
            
        })  
        
}

const deleteAll = async (req, res) => {
 

    const sqldelete1= `SELECT * FROM studpis WHERE gradeLevel = ?`

        db.query(sqldelete1,'12', (err,result)=>{
            if(err) return res.sendStatus(500)
                    if(!result[0]) return res.sendStatus(204)
                    Delete1()
                                function Delete1(){
                                    for (let i = 0; i < result.length; i++) {

                                        const sqldelete1= `DELETE FROM accounts WHERE accountID = ?`
                                            db.query(sqldelete1,result[i].accountID, (err,result)=>{
                                                if(err) return res.sendStatus(500)
                                            })
                                        
                                    }
                                    Delete2()
                                }
                                    
                                function Delete2(){
                                    for (let i = 0; i < result.length; i++) {

                                        const sqldelete2= `DELETE FROM studpis WHERE accountID = ?`
                                            db.query(sqldelete2,result[i].accountID, (err,result)=>{
                                                if(err) return res.sendStatus(500)
                                            })
                                        
                                    }
                                    Delete3()
                                }
                                 function Delete3(){
                                    for (let i = 0; i < result.length; i++) {

                                        const sqldelete3= `DELETE FROM piscontent WHERE pisID = ?`
                                            db.query(sqldelete3,result[i].pisID, (err,result)=>{
                                                if(err) return res.sendStatus(500)
                                            })
                                          
                                    }
                                    return  res.sendStatus(200)   
                                }
                                           
                   
        })  
 
}
       

module.exports = {
    deleteAcc,
    deleteAll
}
