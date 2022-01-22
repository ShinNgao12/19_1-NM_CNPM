const { models, sequelize } = require('../../config/database/index');

exports.getTeacher = async (id_login) => {
    var data = await models.giaovien.findOne({
        where: {
            ID_LogIn: id_login,
        },

        raw: true,
    });

    return data;
};

exports.getTeacher_by_maGV = async (maGV) => {
    var data = await models.giaovien.findOne({
        where: {
            MaGV: maGV,
        },

        raw: true,
    });

    return data;
};