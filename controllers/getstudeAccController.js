const db = require('../middleware/myDB');
const bcrypt = require('bcrypt');
const crypto = require("crypto");
const fetch = require('node-fetch')


const getstudDetails = async (req, res) => {
    const accID = req.params.accID

    const sqlgetstudD= "SELECT * FROM accounts INNER JOIN studpis ON accounts.accountID = studpis.accountID Where accounts.accountID = ?";
 
    db.query(sqlgetstudD,[accID],(err,result)=>{ 
        // console.log({err:err})
        res.send(result)
    })

    //  const sqlgetstudD= "SELECT * FROM accounts WHERE accountID = ?";
    //     db.query(sqlgetstudD,[accID],(err,result)=>{ 
    //         res.send(result)
    //     })

}


const editstudDetails = async (req, res) => {
    const {type} = req.body   

    if(type === 'details'){
        const {accID, lrn, contactNumber} = req.body
        const sqlgetstudD= "UPDATE studpis set contactNumber = ? Where LRN = ?";
        db.query(sqlgetstudD,[contactNumber, lrn],(err,result)=>{ 
            res.send(result)
            
        })
    }else if (type === 'password'){
        const {accID, bycrptOldpas,oldpassword, newpassword} = req.body

        const hashed = await bcrypt.hash(newpassword , 10); // true

        let compare = '';
        bcrypt.compare(oldpassword, bycrptOldpas, function(err, result) {
            compare += result;

            if(compare === 'false') return res.sendStatus(404)
    
            if(compare === 'true') {
                const sqlupdatepass= "UPDATE accounts set password = ? WHERE accountID = ?";
                    db.query(sqlupdatepass,[hashed,accID],(err,result)=>{
                        res.sendStatus(200)
                    })
            }
        })

      
    }
}   


const temporaryPass = async (req, res) => {
    const {user} = req.params
    const apikey='eb7fb477f3228379cb3e2babe4e4b89f7c292e63'
    const reqID = crypto.randomBytes(2).toString("hex");
    const hashed = await bcrypt.hash(reqID , 10)
    const sqlgetstudD= "SELECT * FROM accounts INNER JOIN studpis ON accounts.accountID = studpis.accountID Where accounts.username = ?";
    const sqlupdatepass= "UPDATE accounts set password = ? WHERE accountID = ?";
    db.query(sqlgetstudD,[user],(err,result)=>{ 

                                if (!result[0]) return GcChangepass()
                                    const contactNum = result[0].contactNumber
                                
                                if ((result[0].contactNumber).length < 10) return res.sendStatus(204)
                    db.query(sqlupdatepass,[hashed,result[0].accountID],(err,result)=>{
                        if(err) return res.sendStatus(500)
                            if(result){
                                const message = `Your Temporary Password is ${reqID} please login and change it immediately  \\n \\n \\n NOTE: Do not reply on this message this is system generated.`
                                async function Setcaw () {
                                        const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${contactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                        const ressponse = response;
                                }
                                Setcaw()
                                res.sendStatus(200)
                            }
                    })
        
 

    })

    function GcChangepass(){
        const sqlgetstudD= "SELECT * FROM accounts INNER JOIN guidancecdetails ON accounts.accountID = guidancecdetails.accountID Where accounts.username = ?";
            db.query(sqlgetstudD,[user],(err,result)=>{ 
        if(!result[0]) return res.sendStatus(205)
        
        const contactNum = result[0].contactNumber
        
        if ((result[0].contactNumber).length < 11) return console.log('gc no number')
        const sqlupdatepass= "UPDATE accounts set password = ? WHERE accountID = ?";
                    db.query(sqlupdatepass,[hashed,result[0].accountID],(err,result)=>{
                        if(err) return res.sendStatus(500)
                                const message = `Your Temporary Password is ${reqID} please login and change it immediately \\n \\n \\n NOTE: Do not reply on this message this is system generated.`
                                async function Setcaw () {
                                        const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${contactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                        const ressponse = response;
                                }
                                Setcaw()
                        res.sendStatus(200)
                    })
    
    })
    }


    
}


module.exports = {
    getstudDetails,
    editstudDetails,
    temporaryPass
}
