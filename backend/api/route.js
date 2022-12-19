'use strict';
module.exports = function (app) {
    let productsCtrl = require('./controller');

    app.route('/login').post(productsCtrl.authen);

    app.route('/get-all-products').get(productsCtrl.allProduct);

    app.route('/add-review').post(productsCtrl.addReview);
};
