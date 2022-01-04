const express = require('express');
const path = require('path');
const morgan = require('morgan');
const route = require('./routes');
const handlebars = require('express-handlebars');
require('dotenv').config('../.env');

const app = express();
const port = 3000;

const { sequelize } = require('./config/database');

sequelize
    .authenticate()
    .then(() => {
        console.log('succeed');
    })
    .catch((err) => {
        console.log(err.message);
    });

// static files
app.use(express.static(path.join(__dirname, 'public')));

// Template engine
app.engine(
    '.hbs',
    handlebars.engine({
        extname: '.hbs',
    }),
);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', '.hbs');

app.use(
    express.urlencoded({
        extended: true,
    }),
);
app.use(express.json());

app.use(morgan('combined'));

route(app);

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
});
