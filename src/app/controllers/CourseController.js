const listCourses = require('../services/listCourses');

class CourseController {
    // [GET] /
    async index(req, res, next) {
        res.render('course');
    }
}

module.exports = new CourseController();
