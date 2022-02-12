const db = require('../models/db.js');
const User = require('../models/UserModel.js');
const { validationResult } = require('express-validator');

const signupController = {
    // load signup page
    getSignup: function(req, res) {
        res.render('register');
    },
    
    // check email if unique
    getCheckEmail: function(req, res) {
        var email = req.query.email;
        db.findOne(User, {email: email}, 'email', function(result) {
            console.log(result);
            res.send(result);
        });
    },
    // check username if unique
    getCheckUsername: function(req, res) {
        var username = req.query.username;
        db.findOne(User, {username: username}, 'username', function(result) {
            console.log(result);
            res.send(result);
        });
    }
}

module.exports = signupController;
