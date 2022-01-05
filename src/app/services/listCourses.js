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
        item.LinkAvatar = item['GVCN_giaovien.LinkAvatar'];
    }

    return data;
};

exports.getCourse = async (slug_2) => {
    var data = await models.khoahoc.findOne({
        where: {
            Slug: slug_2,
        },

        include: [
            { model: models.giaovien, required: true, as: 'GVCN_giaovien' },
        ],
        raw: true,
    });
        
    data.HoTen = data['GVCN_giaovien.HoTen'];
    data.LinkAvatar = data['GVCN_giaovien.LinkAvatar'];

    return data;
};
