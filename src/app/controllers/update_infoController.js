const giaovien = require('../services/giaoVien');
const hocvien = require('../services/hocVien');
const { models, sequelize } = require('../../config/database/index');

class Update_infoController {
    // [GET] /
    async index(req, res) {
        var user;
        if (req.session.isTeacher)
            user = await giaovien.getTeacher_by_maGV(req.session.maSo);
        else 
            user = await hocvien.getStudent_by_maHV(req.session.maSo);

        res.render('update_info', { user, session: req.session});
    }

    async show(req, res) {
        if (
            req.body.HoTen == '' || 
            req.body.NgaySinh == '' || 
            req.body.SoDienThoai == '' ||
            req.body.Email == '' ||
            req.body.DiaChi == ''
        ) {
            res.render('update_info', { user: req.body, session: req.session, isEmpty: true } )
        }
        else {
            const new_HoTen = req.body.HoTen;
            const new_NgaySinh = req.body.NgaySinh;
            const new_GioiTinh = req.body.GioiTinh;
            const new_SoDienThoai = req.body.SoDienThoai;
            const new_Email = req.body.Email;
            const new_DiaChi = req.body.DiaChi;
            const maSo = req.session.maSo;

            const updateGiaoVien = (new_HoTen, new_NgaySinh, new_GioiTinh, new_SoDienThoai, new_Email, new_DiaChi, maSo) => {
                const sql = `
                    UPDATE giaovien
                    SET HoTen = '${new_HoTen}',
                        NgaySinh = '${new_NgaySinh}',
                        GioiTinh = '${new_GioiTinh}',
                        SoDienThoai = '${new_SoDienThoai}',
                        Email = '${new_Email}',
                        DiaChi = '${new_DiaChi}'
                    WHERE MaGV = ${maSo};
                `
                return sequelize.query(sql, {
                  type: sequelize.QueryTypes.UPDATE
                })
            }

            const updateHocVien = (new_HoTen, new_NgaySinh, new_GioiTinh, new_SoDienThoai, new_Email, new_DiaChi, maSo) => {
                const sql = `
                    UPDATE hocvien
                    SET HoTen = '${new_HoTen}',
                        NgaySinh = '${new_NgaySinh}',
                        GioiTinh = '${new_GioiTinh}',
                        SoDienThoai = '${new_SoDienThoai}',
                        Email = '${new_Email}',
                        DiaChi = '${new_DiaChi}'
                    WHERE MaHV = ${maSo};
                `
                return sequelize.query(sql, {
                  type: sequelize.QueryTypes.UPDATE
                })
            }
    
            if (req.session.isTeacher) {
                updateGiaoVien(new_HoTen, new_NgaySinh, new_GioiTinh, new_SoDienThoai, new_Email, new_DiaChi, maSo);
            }
            else {
                updateHocVien(new_HoTen, new_NgaySinh, new_GioiTinh, new_SoDienThoai, new_Email, new_DiaChi, maSo);
            }
            
            res.redirect('/home')
        }
    }
}

module.exports = new Update_infoController();
