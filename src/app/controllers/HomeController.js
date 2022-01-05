const listCourses = require('../services/listCourses');

class HomeController {
    // [GET] /
    async index(req, res, next) {
        const khoahoc_opening = await listCourses.getCourses_state('Đang mở');
        const khoahoc_opensoon = await listCourses.getCourses_state('Sắp mở');
        res.render('home', { khoahoc_opening, khoahoc_opensoon });
        //es.json(khoahoc_opensoon);
    }
}

module.exports = new HomeController();
