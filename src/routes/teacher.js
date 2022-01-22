const express = require('express');
const router = express.Router();

const teacherController = require('../app/controllers/teacherController');

router.get('/course/update/:slug', teacherController.show_update);
router.post('/course/update/:slug', teacherController.update);
router.get('/course/:slug', teacherController.show_course);
router.get('/create', teacherController.show_create);
router.post('/create', teacherController.create);
router.get('/', teacherController.index);

module.exports = router;
