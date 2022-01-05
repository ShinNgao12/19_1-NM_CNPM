const listCourses = require('../services/listCourses');

class CourseController {
    // [GET] /
    async index(req, res, next) {
        res.render('course');
    }

    async show(req, res, next) {
        const course = await listCourses.getCourse(req.params.slug);
        res.render('course', { course });
    }
}

module.exports = new CourseController();
