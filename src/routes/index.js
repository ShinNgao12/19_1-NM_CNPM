const homeRouter = require('./home');
const loginRouter = require('./login');
const courseRouter = require('./course');

function route(app) {
    app.use('/course', courseRouter);
    app.use('/login', loginRouter);
    app.use('/', homeRouter);
}

module.exports = route;
