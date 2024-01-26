const express = require('express');
const router = express.Router();
const tolongEventsController = require('../controllers/tolongEventsController');

router.route('/')
    .post(tolongEventsController.postlongEvents)
    .get(tolongEventsController.getlongEvents)
    .patch(tolongEventsController.editlongEvents)

router.route('/:id')
    .delete(tolongEventsController.deletelongEvents)

module.exports = router;