const Sequelize = require('Sequelize');
const initModels = require('../../models/init-models');

const sequelize = new Sequelize(
    "onlinecourse",
    "root",
    "123456",
    {
        host: process.env.DB_HOST,
        dialect: 'mysql',
    },
);

module.exports = {
    sequelize,
    models: initModels(sequelize),
};
