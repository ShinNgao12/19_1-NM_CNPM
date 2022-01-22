const express = require('express');
const router = express.Router();

const update_infoController = require('../app/controllers/update_infoController');

router.get('/', update_infoController.index);
router.post('/', update_infoController.show);

module.exports = router;
