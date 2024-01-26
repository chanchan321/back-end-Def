const express = require('express');
const router = express.Router();
const getstudeAccController = require('../controllers/getstudeAccController');


router.route('/:accID')
    .get(getstudeAccController.getstudDetails)

router.route('/')
    .patch(getstudeAccController.editstudDetails)


router.route('/:user')
    .patch(getstudeAccController.temporaryPass)
    

module.exports = router;