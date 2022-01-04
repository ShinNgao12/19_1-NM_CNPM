const { models, sequelize } = require('../../config/database/index');

exports.getCourses_state = async (state) => {
    var data = await models.khoahoc.findAll({
        where: {
            TrangThaiHD: state,
        },

        include: [
            { model: models.giaovien, required: true, as: 'GVCN_giaovien' },
        ],
        raw: true,
    });

    for (const item of data) {
        item.HoTen = item['GVCN_giaovien.HoTen'];
    }

    return data;
};
