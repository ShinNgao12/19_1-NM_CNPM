class HomeController {
    // [GET] /
    index(req, res) {
        res.render('login');
    }
}

module.exports = new HomeController();
