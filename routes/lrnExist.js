const express = require('express');
const router = express.Router();
const lrnExistController = require('../controllers/lrnExistController');

router.route('/:user')
    .get(lrnExistController.getAllLrn)
    

module.exports = router;