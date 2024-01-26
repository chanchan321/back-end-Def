const express = require('express');
const router = express.Router();
const deleteAccounts = require('../controllers/deleteAccounts');

router.route('/:lrn/:accountID/:pisID')
    .delete(deleteAccounts.deleteAcc)

router.route('/')
    .delete(deleteAccounts.deleteAll)
    

module.exports = router;