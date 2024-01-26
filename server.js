const express = require('express');
const cors = require('cors');
const app = express();
const corsOptions = require('./config/corsOptions');
const PORT = 3500;
const db = require('./middleware/myDB');
const cron = require('node-cron')
const fetch = require('node-fetch')
const bcrypt = require('bcrypt');
const xlsx = require('xlsx');
const mysql = require("mysql");
const path = require('path');
const Importer = require('mysql-import')
const crypto = require("crypto");
const fs = require('fs')
const fileUpload = require("express-fileupload");
const filesPayloadExists = require('./middleware/filesPayloadExists');
const fileExtLimiter = require('./middleware/fileExtLimiter');
const fileSizeLimiter = require('./middleware/fileSizeLimiter');

require("dotenv").config();

app.use(cors(corsOptions));

app.use(express.urlencoded({ extended: false }));

app.use(express.json());

app.use('/register', require('./routes/register'));

app.use('/login', require('./routes/login'));

app.use('/pis', require('./routes/pis'));

app.use('/appointment', require('./routes/appointment'));

app.use('/availableCal', require('./routes/availableCal'));

app.use('/getStud', require('./routes/getStud'));

app.use('/referral', require('./routes/referral'));

app.use('/gcAppointment', require('./routes/gcAppointment'));

app.use('/getEvents', require('./routes/getEvents'));

app.use('/eventDcalendar', require('./routes/EventDcalendar'));

app.use('/resched', require('./routes/resched'));

app.use('/getAllEvents', require('./routes/getAllEvents'))
;
app.use('/getstudAccDetails', require('./routes/getstudAccDetails'));

app.use('/counselingRec', require('./routes/counselingRec'));

app.use('/markAsDone', require('./routes/markAsDone'));

app.use('/getEventID', require('./routes/getEventID'));

app.use('/editEvent', require('./routes/editEvent'));

app.use('/gcDetails', require('./routes/gcDetails'));

app.use('/studentAccount', require('./routes/studentAccount'));

app.use('/getCounselingRec', require('./routes/getCounselingRec'));

app.use('/forDasboard', require('./routes/forDasboard'));

app.use('/notification', require('./routes/notification'));

app.use('/longEvents', require('./routes/longEvents'));

app.use('/deleteAccounts', require('./routes/deleteAcc'));

app.use('/lrnExist', require('./routes/lrnExist'));

cron.schedule("01 23 00 * * *", async () => {

        let gcContactNum = ''
        const apikey='eb7fb477f3228379cb3e2babe4e4b89f7c292e63'
        const sqlupdate= "SELECT contactNumber FROM guidancecdetails WHERE accountID = ?"
                db.query(sqlupdate,['a7a45ac2afe3b2633775998d038d4396'],(err,result)=>{
                        gcContactNum += result[0].contactNumber
                })
        const todaydate = new Date();
        var dd = todaydate.getDate();
        var mm = todaydate.getMonth()+1; 
        var yyyy = todaydate.getFullYear();
        if(dd<10) {dd='0'+dd} 
        if(mm<10) { mm='0'+mm} 
        const date =(`${yyyy}-${mm}-${dd}`)



                        // NUMBER OF APPOINTMENT AND REFERRAL REQUEST --------- TO GC
                function Requests(){
                        const sqlgetAppointment= "SELECT * FROM appointmentrequestlist Where status = ?";
                        db.query(sqlgetAppointment,'pending',(err,result)=>{
                        if(err) return console.log(err)
                                const appointment = result.length

                                const sqlgetReferral= "SELECT * FROM refferralrequest Where status = ?";
                                db.query(sqlgetReferral,'pending',(err,result)=>{
                                if(err) return console.log(err)
                                        const referral = result.length

                                        const type = 'Counseling'
                                        const message = `As of Today there are ${appointment} appointment and ${referral} referral request pending  `
                                        const status = 'unread'
                
                                        const sqlupdate= "INSERT INTO notificationgc (type, message, status) VALUES (?, ?, ?)"
                                        db.query(sqlupdate,[type,message,status],(err,result)=>{
                                                if(err) return console.log(err)
                                                const resultNotif = result
                                        })
                                                
                                        async function Setcaw () {
                                                const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${gcContactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                const ressponse = response;
                                        }
                                        Setcaw()

                                })
                        })
                }

                        // NUMBER OF EVENTS TODAY FOR GC---- TO GC
                function EventToday(){
                        const sqlgetEventsToday= "SELECT * FROM calendarevents WHERE status = ? and setDate = ?";
                        db.query(sqlgetEventsToday,['ongoing', date],(err,result)=>{
                                if(err) return console.log(err)
                        
                                if(!result[0]) return console.log('dont send SMS')
                                ///////SMS ONLY---- to gc
                                if(result[0]){
                                        const message = `You have ${result.length} event/s TODAY!! Login to view Details`
                                        async function Setcaw () {
                                                const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${gcContactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                const ressponse = response;
                                        }
                                        Setcaw()

                                } 
                        })
                }

                        // NUMBER OF COMPLETE PIS AND INCOMPLETE PIS ---------------- TO GC
                function HowManySubmitted(){
                        const sqlgetPIS= "SELECT * FROM piscontent";
                        db.query(sqlgetPIS,(err,result)=>{

                                if(err) return console.log(err)
                                const complete =result[0] && result.filter((value)=> value.statusComp === 'complete');
                                const incomplete =result[0] && result.filter((value)=> value.statusComp === 'incomplete');

                                const type = 'PIS'
                                const message = `There are ${complete.length} complete PIS and ${incomplete.length} incomplete PIS form of students`
                                const status = 'unread'

                                        // const sqlupdate= "INSERT INTO notificationgc (type, message, status) VALUES (?, ?, ?)"
                                        // db.query(sqlupdate,[type,message,status],(err,result)=>{
                                        // if(err) return console.log(err)
                                        // const resultNotif = result
                                        // console.log('insert HowManySubmitted')
                                        // })

                                        async function Setcaw () {
                                                console.log('send HowManySubmitted')
                                                const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${gcContactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                const ressponse = response;
                                        }
                                        Setcaw()
                        })
                }

                        // REMINDER TO STUDENT TO COMPLETE PIS SHEET --------------- TO STUDENT
                function ReminderPIS(){
                
                        const dayNames = ["Sunday","7","8","9","10","11","12"];    
                                                                                                                                        
                        if(dayNames[todaydate.getDay()] === 'Sunday'){
                                console.log('dont Send!')
                        }else{
                        const gradeL =dayNames[todaydate.getDay()]
                        const messageTOstud = 'please Complete your PIS information as soon as possible   \\n \\n \\n NOTE: Do not reply on this message this is system generated.'
                                const getSQL = `SELECT * FROM studpis INNER JOIN piscontent ON studpis.pisID = piscontent.pisID Where piscontent.statusComp = ? AND studpis.gradeLevel = ?;`
                                db.query(getSQL,['incomplete',gradeL], (err,result)=>{
                                if(err) return console.log(err)
                                
                                const studentsTOsend = result.filter((data)=> (data.contactNumber).length > 10)
                                if(!studentsTOsend[0]) return console.log('NO number or No student on grade level')
                                                                ///////SMS ONLY------------                                                                                                                
                                        for (let i = 0; i < studentsTOsend.length;  i++) {
                                                const studNumber = studentsTOsend[i].contactNumber
                                                const message = ` ${(studentsTOsend[i].firstname).toUpperCase()} ` + messageTOstud
                                                async function Setcaw () {      
                                                        const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${studNumber}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                        const ressponse = response;
                                                }
                                                Setcaw()
                                        }
                                })
                        }
                        
                }

                        // REMINDER TO STUDENT OF THEIR APPOINTMENT --------------- TO STUDENT
                function NoticeForAppointment(){
                        const getSQL = `SELECT * FROM appointmentrequestlist INNER JOIN studpis ON appointmentrequestlist.studLrn = studpis.LRN Where appointmentrequestlist.dateRequested = ? AND status = ?;`
                                db.query(getSQL,[date,'ongoing'], (err,result)=>{
                                        if(err) return console.log(err)
                                        // console.log(result)
                                        const studentsTOsend = result.filter((data)=> (data.contactNumber).length === 13)
                                        if(!result[0]) return console.log(' dont send SMS')
                                        for (let i = 0; i < studentsTOsend.length;  i++) {
                                                const studNUmber = studentsTOsend[i].contactNumber
                                                const message = ` ${(studentsTOsend[i].firstname).toUpperCase()} ` + ` your Appointment is TODAY at ${(JSON.parse([studentsTOsend[i].timeRequested])).toString()} \\n \\n \\n NOTE: Do not reply on this message this is system generated.`
                                                
                                                async function Setcaw () {
                                                        console.log('adawd')
                                                        const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${studNUmber}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                        const ressponse = response;
                                                }
                                                Setcaw()
                                                //MAY APPOINTMENT ang student i notify
                                        }    
                                })        
                }

                        // REMINDER TO STUDENT OF THEIR REFERRAL --------------- TO STUDENT
                function NoticeForReferral() {

                                const getSQL = `SELECT * FROM calendarevents INNER JOIN refferralrequest ON calendarevents.eventID = refferralrequest.eventID Where calendarevents.setDate = ? AND calendarevents.status = ?;`
                                db.query(getSQL,[date,'ongoing'], (err,result)=>{
                                        if(err) return console.log(err)
                                        // const apikey='84b1a789051b7233a14135d35c053e0550cbf734'
                                        const lrn = []
                                        const referralReq = result

                                        for (let i = 0; i < result.length;  i++) {
                                                lrn.push(result[i].studLrn)
                                        }       

                                                for (let i = 0; i < lrn.length;  i++) {
                                                const studLrn = lrn[i]
                                                
                                                const getSQL = `SELECT * FROM studpis INNER JOIN refferralrequest ON studpis.LRN = refferralrequest.studLrn Where studpis.LRN = ? ;`
                                                // const getSQL = `SELECT * FROM studpis Where LRN = ?;`
                                                db.query(getSQL,studLrn, (err,result)=>{
                                                        const studentsTOsend = result.filter((data)=> (data.contactNumber).length === 13)
                                                        // console.log(studentsTOsend)

                                                        for (let i = 0; i < studentsTOsend.length;  i++) {
                                                                const studentsNum = referralReq.filter((data)=> data.studLrn === studentsTOsend[i].studLrn)
                                                                // console.log(studentsNum)
                                                        
                                                                const contactNum = studentsTOsend[i].contactNumber
                                                                const message = 'REMINDER: '+ studentsNum[0].nameOfStudent +' you have Meeting Today at ' + (JSON.parse(studentsNum[0].setTime)).toString()  + ' \\n \\n \\n NOTE: Do not reply on this message this is system generated.'
                                                                
                                                                async function Setcaw () {
                                                                        const response= await fetch(`https://sms.teamssprogram.com/api/send?key=${apikey}&phone=${contactNum}&sim=${2}&message=${message}&priority=${1}&device=${581}`)                
                                                                        const ressponse = response;
                                                                }
                                                                Setcaw()
                                                        }
                                                })

                                        } 
                                })
                }
                Requests()
                EventToday()
                HowManySubmitted()
                ReminderPIS()
                NoticeForAppointment()
                NoticeForReferral()

    }, {
       timezone: "Asia/Manila"
     })


        app.use('/backUPrestore',fileUpload({ createParentPath: true }), require('./routes/backUPrestore'));

                //GET IMAGE
         app.use('/img/:pisID/:imgName', (req, res, next) => {
         const pisID = req.params.pisID
         const imgName = req.params.imgName
             express.static(__dirname+'/students/'+pisID+'/'+imgName)(req, res, next);
        });

                //DELETE IMAGE
         app.delete('/img/delete/:pisID/:imgDel/:saveDB', (req, res) => {
         const deletethis = (JSON.parse(req.params.imgDel)[0])
         const status = JSON.parse(req.params.saveDB).length >= 3? 'complete':'incomplete'
         console.log(status)
         const sqlUpdateHOMES= `UPDATE piscontent Set homeSketch = ?, statusComp = ? WHERE pisID = ?`
         db.query(sqlUpdateHOMES,[req.params.saveDB,status,req.params.pisID],(err,result)=>{
     
             fs.unlinkSync(__dirname+'/students/'+req.params.pisID+'/'+deletethis, (err => {
             if (err) return console.log(err);
                     
             }))
             res.send(result)
     
             // res.send(result)
             // console.log(result)
             // console.log(err)
         })
         
        });

                //POST IMAGE
        app.post('/upload/:lrn/:arr',
         fileUpload({ createParentPath: true }),
         filesPayloadExists,
         fileExtLimiter(['.png', '.jpg', '.jpeg']),
         fileSizeLimiter,
         (req, res) => {
             const files = req.files
             // console.log(req.files)
             const piisID =req.params.lrn
             // console.log(JSON.parse(req.params.arr))
             let nameofFile=[]
             const filename = crypto.randomBytes(8).toString("hex");
     
             const homeS = JSON.parse(req.params.arr)
           
             Object.keys(files).forEach(key => {
                 nameofFile.push(files[key].name)
                 // console.log(nameofFile)
                 // console.log((nameofFile[0].split('.')).slice(-1)[0])
                 // const filepath = path.join( files[key].name)
                 // const filepath = path.join( __dirname,files[key].name)
                 const filepath = path.join(__dirname,'students', req.params.lrn ,filename+'.'+(nameofFile[0].split('.')).slice(-1)[0])
                 files[key].mv(filepath, (err) => {
                     if (err) return res.status(500).json({ status: "error", message: err })
                 })
             })
     
             homeS.push(filename+'.'+(nameofFile[0].split('.')).slice(-1)[0])
             const todaydate = new Date();
                 var dd = todaydate.getDate();
                 var mm = todaydate.getMonth()+1; 
                 var yyyy = todaydate.getFullYear();
     
                 if(dd<10) {dd='0'+dd} 
                 if(mm<10) { mm='0'+mm} 
                //  console.log(`${yyyy}-${mm}-${dd}`)
             console.log(homeS)
             // console.log(homeS.length)
             console.log(homeS)
             const status= homeS.length == 1 ? 'complete': 'incomplete'
             const dateComplete= status === 'complete'? `${yyyy}-${mm}-${dd}`: ''
             const sqlGET= `UPDATE piscontent SET homeSketch = ?, statusComp = ?, dateComplete = ? where pisID = ?`
                 db.query(sqlGET,[JSON.stringify(homeS),status,dateComplete,piisID] ,(err,result)=>{
                      if(err) return res.sendStatus(500)
                //       console.log(result)
                      return res.json({ status: 'success', message: Object.keys(files).toString() })
             })  
     
             
         }
        )
     
                //restore db
        app.post('/upload',
        fileUpload({ createParentPath: true }),
        fileExtLimiter(['.sql']),
                (req, res) => {
                const files = req.files
                
                console.log(files)
                Object.keys(files).forEach(key => {
                        // console.log(files[key])
                        const filepath = path.join(__dirname,'Restore.sql')
                        files[key].mv(filepath, (err) => {
                        if (err) return res.status(500).json({ status: "error", message: err })
                        })
                })
        
                //  setTimeout(()=>{
                        deletess()
                //  },2000)
                
                
                function deletess()  {
                        var del = mysql.createConnection({
                                host: "localhost",
                                user: "root",
                                password: "",
                                database: "dbtesting"
                        });
                        del.connect(function(err) {
                        if (err) throw err;
                        var sql = "DROP DATABASE dbtesting";
                        del.query(sql, function (err, result) {
                        if (err) throw err;
                        //    console.log('wait to delete')
                        if(result) return createzz()
                        })
                        })
                }
                
                        
                        function createzz() {
                
                        var cre = mysql.createConnection({
                                host: "localhost",
                                user: "root",
                                password: ""
                                });
                
                        cre.connect(function(err) {
                        if (err) throw err;
                        //  console.log("Connected!");
                        cre.query("CREATE DATABASE dbtesting", function (err, result) {
                        if (err) throw err;
                        //    console.log('wait to create')
                        if(result) return importz()
                        
                        
        
                        })
                        })
                        }
                
                
                
                function importz() {
                
                        const host = 'localhost';
                        const user = 'root';
                        const password = '';
                        const database = 'dbtesting';
                        
                        const importer = new Importer({host, user, password, database});
                                
                                importer.onProgress(progress=>{
                                var percent = Math.floor(progress.bytes_processed / progress.total_bytes * 10000) / 100;
                                //  console.log(`${percent}% Completed`);
                                });
                                
                                //  importer.import('./Restore.sql').then(()=>{
                                //  var files_imported = importer.getImported();
                                // //  console.log(`${files_imported.length} SQL file(s) imported.`);
        
                                importer.import('./Restore.sql').then(()=>{
                                
                                var files_imported = importer.getImported();
                                // console.log(`${files_imported.length} SQL file(s) imported.`);
        
                                //  fs.unlinkSync('Restore.sql', (err => {
                                //     if (err) return console.log(err);
                                
                                //     }))
                                // console.log('wait to insert')
        
                                res.sendStatus(200)   
                                }).catch(err=>{
                                console.error(err);
                                })
                }
        
                }
        )

                ///UPLOAD EXCEL STUDENTS LIST
        app.post('/uploadExcel',
        fileUpload({ createParentPath: true }),
        fileExtLimiter(['.xlsx']),
         async (req, res) => {
             const files = req.files
     
             const hashed = await bcrypt.hash('1', 10)
            
     
     
                     Object.keys(files).forEach(key => {
                         // console.log(files[key])
                         const filepath = path.join('students.xlsx')
     
                         files[key].mv(filepath, (err) => {
                             if (err) return res.status(500).json({ status: "error", message: err })
                                     try{
     
                                     
                                     const workbook = xlsx.readFile('students.xlsx')
                                    
                                       for(let indexZ = 0 ; indexZ <= workbook.SheetNames.length-1; indexZ++){
     
                                     const worksheet = workbook.Sheets[workbook.SheetNames[indexZ]]
     
                                   
                                     const range = xlsx.utils.decode_range(worksheet["!ref"])
                                         
                                             for(let row = range.s.r + 1 ; row <= range.e.r; row++){  
     
                                                 let data = []  
                                                     
                                                 try{
                                                  
                                                     for(let col = range.s.c; col<=range.e.c; col++){
                                                         let cell = worksheet[xlsx.utils.encode_cell({r:row,c:col})]
                                                         data.push(cell.v)
                                                     }
                                                 }catch(err){
                                                     // console.log({eeXrorr:err})
                                                     // fs.unlinkSync('students.xlsx', (err => { 
                                                     //     if (err) return console.log(err) 
                                                     // }))
                     
                                                    return res.sendStatus(500)
                                                 }
     
                                                     // console.log({accountID:crypto.randomBytes(14).toString("hex")})
                                                     // console.log({pisID:crypto.randomBytes(8).toString("hex")})
                                                     // console.log({lrn:data[0]})
                                                     // console.log({grade:workbook.SheetNames[indexZ]})
                                                     // console.log({lastname:data[1]})
                                                     // console.log({firstname:data[2]})
                                                     // console.log({middlename:data[3]})
                                                     // console.log(hashed)
                                                     // console.log([...data,workbook.SheetNames[indexZ]])
     
                                                     const accountID = crypto.randomBytes(14).toString("hex")
                                                     const pisID = data[0]+'PIS'
                                                     const lrn = data[0]
                                                     const lastname = data[1]
                                                     const firstname = data[2]
                                                     const middlename = data[3]
                                                     const grade = workbook.SheetNames[indexZ]
                                                    
     
                                                     
                                             const personalBG = {
                                                         lrn:lrn,
                                                         lastname:lastname,
                                                         firstname:firstname,
                                                         middlename:middlename,
                                                         age:'',
                                                         dateOfBirth:'',
                                                         placeOfBirth:'',
                                                         gender:'',
                                                         birthAmongSib:'',
                                                         citizenship:' ',
                                                         religion:'',
                                                         civilStatus:'',
                                                         currentAddress:'',
                                                         permanentAddress:'',
                                                         landline:'',
                                                         cellphoneNo:'',
                                                         eMail:'',
                                                         languageSpoken:''
                                             }
                                             const familyBG ={
                                                 father :
                                                 {
                                                       status:'',
                                                       name:' ',
                                                       age:'',
                                                       religion:'',
                                                       nationality:'',
                                                       educationalAttainment:'',
                                                       occupation:'  ',
                                                       positionEmployer:'',
                                                       officeBusinessAddress:'',
                                                       contactNumber:''
                                                   },
                                                   mother :
                                                   {
                                                         status:'',
                                                         name:' ',
                                                         age:'',
                                                         religion:'',
                                                         nationality:'',
                                                         educationalAttainment:'',
                                                         occupation:'  ',
                                                         positionEmployer:'',
                                                         officeBusinessAddress:'',
                                                         contactNumber:''
                                                     },
                                                 guardian:
                                                       {
                                                 relationshipW:'',
                                                 name:' ',
                                                 age:'',
                                                 religion:'',
                                                 nationality:'',
                                                 educationalAttainment:'',
                                                 occupation:'  ',
                                                 positionEmployer:'',
                                                 officeBusinessAddress:'',
                                                 contactNumber:'',
                                                 monthStayed:''
                                             }
                                             }
                                             const newMaritalStatus = {
                                             married:'',
                                             livingTogether:'',
                                             singleParent:false,
                                             widow:'',
                                             temporarySeperated:'',
                                             permanentlySeperated:'',
                                             marriedAnnulled:'',
                                             fatherOfw:'',
                                             motherOfw:'',
                                             fatherWpartner:'',
                                             motherWpartner:''
                                             }
                                             const educbg2= {
                                                 subjectWithLowestGrade:'',
                                                 subjectWithHighestGrade:'',
                                                 awards:'',
                                                 newscholarship:{
                                                     fourpis:false,
                                                     cibi:false,
                                                     sistersCharity:false,
                                                     others:''
                                                     }
                                             }
                                             const unique = {
                                                 friendsInschool:'',
                                                 outsideInschool:'',
                                                 specialInterest:'',
                                                 hobbies:'',
                                                 characteristicsThatDescibeU:'',
                                                 presentFears:'',
                                                 disabilities:'',
                                                 chronicIllness:'',
                                                 medicinesRegTaken:'',
                                                 accidentsExperienced:'',
                                                 operationsExp:'',
                                                 immunizations:'',
                                         
                                                 consultedPsy:'',
                                                 howmanysessionPsy:'',
                                                 forwhatPsy:'',
                                         
                                                 consultedCoun:'',
                                                 howmanysessionCoun:'',
                                                 forwhatCoun:'',
                                         
                                                 emerContact:'',
                                                 address:'',
                                                 contactNumber:'',
                                         
                                             }
     
                                             const sqlregStud= `INSERT IGNORE INTO accounts (accountID , userType, username, password) VALUES (?,?,?,?);`
      
                                             // const hashed = await bcrypt.hash('1', 10)
                                            
                                             db.query(sqlregStud,[accountID,'student',lrn,hashed], (err,result)=>{
                                                 if(err) return res.sendStatus(500)
     
                                              if(!err){
                                                const sqlregPis= `INSERT IGNORE  INTO studpis (LRN, accountID, lastname, firstname, middlename, contactNumber, gradeLevel, pisID, counsellingRec) VALUES (?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE gradeLevel = ? , lastname = ? , firstname = ? , middlename = ?`
                                                db.query(sqlregPis,[lrn, accountID, lastname, firstname, middlename, '0', grade, pisID, JSON.stringify([]),grade,lastname,firstname, middlename], (err,result)=>{
                                                        if(err) return res.sendStatus(500)
                                                             
                                                      if(!err){
                                                        const sqlregPis= `INSERT IGNORE  INTO piscontent (pisID, personalBackground, familyBackground, siblings, maritalStatus, educationalInformation, educbg2, uniqueHealthCosult, homeSketch, dateComplete, statusComp) VALUES (?,?,?,?,?,?,?,?,?,?,?)`
                                                        db.query(sqlregPis,[pisID, JSON.stringify(personalBG), JSON.stringify(familyBG),JSON.stringify([]), JSON.stringify(newMaritalStatus) , JSON.stringify([]), JSON.stringify(educbg2), JSON.stringify(unique),JSON.stringify([]),JSON.stringify([]),'incomplete'], (err,result)=>{
                                                             if(err) return res.sendStatus(500)
                                                        })  
                                                      }
                                                           
                                                })  
                                              }
                                        
                                              })  
     
     
                                                     
                                                 //   let sql = `INSERT INTO students (LRN, lastname, firstname, middlename,grade) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE grade = ?` 
     
                                                 //   db2.query(sql,[...data,workbook.SheetNames[indexZ],workbook.SheetNames[indexZ]],(err,results,fields)=>{
                                                 //           if(err) return console.log(err.message)
     
                                                 //         //   console.log(results)
                                                 //   })
                                             }
     
                                                
                                         }         
     
                                     fs.unlinkSync('students.xlsx', (err => {
                                         if (err) return console.log(err);
                                         }))
                                     
                                     res.sendStatus(200)
                                 
                                 }catch(err){
                                     console.log({erxror:err})
     
                                     fs.unlinkSync('students.xlsx', (err => { 
                                         if (err) return console.log(err) 
                                     }))
     
                                     res.sendStatus(500)
                         
                                     }
     
                 
                 })
     
              }
             )
     
         }
        )
     
        app.all('*', (req, res) => {
                res.send("404 Not Found");
        });



app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



