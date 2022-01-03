const { models } = require('../../config/database/index');

class HomeController {
    // [GET] /
    async index(req, res, next) {
        
    const khoahoc = await models.khoahoc.findAll({
            list_kh: [{
            model: models.giaovien,
            required: true
            }]
          })
          
        const data = await  models.khoahoc.findAll({include: [{model: models.giaovien  , as: 'MaGV'  }]},{raw: true});
        console.log(data)
        res.json(khoahoc)
        
    }
    // index(req, res) {
    //     res.render('home');
    // }
}

module.exports = new HomeController();
