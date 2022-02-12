const db = require('../models/db.js');
const User = require('../models/UserModel.js');

const loginController = {
    getLogin: function(req, res) {
        // if user is still logged in
        if (req.session.username != null) {
            console.log(req.session.username);
            res.render('app', {username: req.session.username});
        }
        else {
            res.render('login');
        }
    },
}

module.exports = loginController;
