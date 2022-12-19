'use strict'

// const util = require('util')
// const mysql = require('mysql')
const db = require('../db');

module.exports = {
    authen: (req, res) => {
        console.log('API: login  --- executed at ' + new Date());
        let email = req.body['email'] ?? '';
        let password = req.body['password'] ?? '';
        if (email.trim().length === 0 || password.trim().length === 0) {
            res.json({ message: 'Thông tin không hợp lệ', code: 400 });
            return;
        }
        let sql = 'SELECT * FROM user WHERE email = ? AND password = ?'
        db.query(sql, [email, password], (err, response) => {
            if (err) throw err
            if (response.length == 0) {
                res.json({ message: 'Sai thông tin đăng nhập', code: 404 });
            } else {
                res.json({ message: '', code: 200, user: response[0] })
            }
        })
    },

    addReview: (req, res) => {
        console.log('API: add-review  --- executed at ' + new Date());
        let sql = 'INSERT INTO danhgia (danhgiasao ,name , email, noidungdanhgia, id_sanpham) VALUES (?, ?, ?, ?, ?)';
        db.query(sql, [req.body['star'], req.body['name'], req.body['email'], req.body['content'], req.body['product_id']], (err, _) => {
            if (err) {
                res.json({ 'code': 404, 'message': err })
            } else {
                res.json({ 'code': 200 })
            }
        })
    },

    allProduct: (req, res) => {
        console.log('API: get-all-products  --- executed at ' + new Date());
        let data = req.body;
        let sql = 'SELECT * FROM sanpham,khuyenmai,danhmuc WHERE sanpham.id_khuyenmai=khuyenmai.id_khuyenmai AND sanpham.id_danhmuc=danhmuc.id_danhmuc'
        db.query(sql, [], (err, response) => {
            if (err) throw err
            res.json({ data: response })
        })
    },

}
