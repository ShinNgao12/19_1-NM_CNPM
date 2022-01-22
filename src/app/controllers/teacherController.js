const listCourses = require('../services/listCourses');
const { models, sequelize } = require('../../config/database/index');

class TeacherController {
    // [GET] /teacher
    async index(req, res, next) {
        const khoahoc_opening = await listCourses.getCourses_ofTeacher('Đang mở', req.session.maSo);
        const khoahoc_opensoon = await listCourses.getCourses_ofTeacher('Sắp mở', req.session.maSo);

        var len_khoahoc_opening = false;
        var len_khoahoc_opensoon = false;
        if (khoahoc_opening.length > 3)
            len_khoahoc_opening = true;
            
        if (khoahoc_opensoon.length > 3)
            len_khoahoc_opensoon = true;
        
        res.render('teacher', { khoahoc_opening, khoahoc_opensoon, session: req.session, len_khoahoc_opening, len_khoahoc_opensoon });
    }

    // [GET] /teacher/course/:slug
    async show_course(req, res, next) {
        const course = await listCourses.getCourse(req.params.slug);
        res.render('course_of_teacher',  { course, session: req.session });
    }

    // [Get] /teacher/create
    async show_create(req, res, next) {
        res.render('createCourse', { session: req.session } )
    }

    // [Post] /teacher/create
    async create(req, res, next) {
        if (
            req.body.TenKH == '' || 
            req.body.HocPhi == '' || 
            req.body.SLHV_Max == '' ||
            req.body.LinhVuc == '' ||
            req.body.LichHoc == '' ||
            req.body.MoTa == '' ||
            req.body.LinkImage == '' ||
            req.body.LinkVideo == ''
        ) {
            res.render('createCourse', { session: req.session, error: true } )
        }
        else {
            var khoaHoc = await models.khoahoc.create( {
                TenKH: req.body.TenKH,
                NgayTao: '2022-01-22',
                NgayBD: req.body.NgayBD,
                NgayKT: req.body.NgayKT,
                HocPhi: req.body.HocPhi,
                SLHV_Max: req.body.SLHV_Max,
                MoTa: req.body.MoTa,
                LinhVuc: req.body.LinhVuc,
                TrangThaiHD: "Sắp mở",
                LichHoc: req.body.LichHoc,
                Slug: req.body.TenKH,
                LinkImage: req.body.LinkImage,
                LinkVideo: req.body.LinkVideo,
                GVCN: req.session.maSo,
            });

            //res.json(khoaHoc);
            res.redirect('/teacher');
        }
    }

    // [GET] /teacher/course/update/:slug
    async show_update(req, res) {
        const khoahoc = await listCourses.getCourse(req.params.slug);
        res.render('update_course', { khoahoc, session: req.session });
    }

    // [POST] /teacher/course/update/:slug
    async update(req, res) {
        const khoahoc = await listCourses.getCourse(req.params.slug);
        const url = '/teacher/course/' + req.params.slug;
        //res.render('course_of_teacher',  { course: khoahoc, session: req.session });
        //res.redirect(url);

        if (
            req.body.TenKH == '' || 
            req.body.HocPhi == '' || 
            req.body.SLHV_Max == '' ||
            req.body.LinhVuc == '' ||
            req.body.LichHoc == '' ||
            req.body.MoTa == '' ||
            req.body.LinkImage == '' ||
            req.body.LinkVideo == ''
        ) {
            res.render('update_course', { khoahoc: req.body, session: req.session, error: true } )
        }
        else {
            const new_TenKH = req.body.TenKH;
            const new_NgayBD = req.body.NgayBD;
            const new_NgayKT = req.body.NgayKT;
            const new_HOCPhi = req.body.HocPhi;
            const new_SLHV_Max = req.body.SLHV_Max;
            const new_LinhVuc = req.body.LinhVuc;
            const new_LichHoc = req.body.LichHoc;
            const new_MoTa = req.body.MoTa;
            const new_LinkImage = req.body.LinkImage;
            const new_LinkVideo = req.body.LinkVideo;
            const Slug = req.params.slug;

            const updateKhoaHoc = (new_TenKH, new_NgayBD, new_NgayKT, new_HOCPhi, new_SLHV_Max, new_LinhVuc, new_LichHoc, new_MoTa, 
                new_LinkImage, new_LinkVideo, Slug) => {
                const sql = `
                    UPDATE khoahoc
                    SET TenKH = '${new_TenKH}',
                        NgayBD = '${new_NgayBD}',
                        NgayKT = '${new_NgayKT}',
                        HocPhi = ${new_HOCPhi},
                        SLHV_Max = ${new_SLHV_Max},
                        LinhVuc = '${new_LinhVuc}',
                        LichHoc = '${new_LichHoc}',
                        MoTa = '${new_MoTa}',
                        LinkImage = '${new_LinkImage}',
                        LinkVideo = '${new_LinkVideo}'
                    WHERE Slug = '${Slug}';
                `
                return sequelize.query(sql, {
                  type: sequelize.QueryTypes.UPDATE
                })
            }
    
            updateKhoaHoc(new_TenKH, new_NgayBD, new_NgayKT, new_HOCPhi, new_SLHV_Max, new_LinhVuc, new_LichHoc, new_MoTa, 
                new_LinkImage, new_LinkVideo, Slug);
            
            res.redirect(url);
        }
    }
}

module.exports = new TeacherController();
