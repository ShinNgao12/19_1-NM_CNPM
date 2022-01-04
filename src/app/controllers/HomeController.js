const listCourses = require('../services/listCourses');

class HomeController {
    // [GET] /
    async index(req, res, next) {
        const khoahoc_opening = await listCourses.getCourses_state('Opening');
        const khoahoc_opensoon = await listCourses.getCourses_state('OpenSoon');
        res.render('home', { khoahoc_opening, khoahoc_opensoon });
        //res.json(khoahocs);

        // const projects = await sequelize.query(
        //     'SELECT * FROM `khoahoc` AS `kh` INNER JOIN `giaovien` AS `gv` ' +
        //       'ON `gv`.`MaGV` = `kh`.`GVCN` ');
        // res.render('home', {data: projects[0]});
        //res.json(projects[0])

        // const data = await models.khoahoc.findAll(
        //     {
        //         include: [
        //             { model: models.giaovien, required: true, as: 'GVCN_giaovien'},
        //         ],
        //         raw: true,
        //     },
        // );

        // for (const item of data) {
        //     item.HoTen = item["GVCN_giaovien.HoTen"]
        // }
    }
    // index(req, res) {
    //     res.render('home');
    // }
}

module.exports = new HomeController();
