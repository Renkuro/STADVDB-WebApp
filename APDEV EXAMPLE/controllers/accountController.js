const db = require('../models/db.js');
const User = require('../models/UserModel.js');
const Event = require('../models/EventModel.js');
const bcrypt = require('bcrypt');
const saltRounds = 10;

function formatDate(date) {
    return date.getFullYear().toString() + '-' + (date.getMonth() + 1).toString().padStart(2, 0) + '-' + date.getDate().toString().padStart(2, 0);
}

const accountController = {  

    getAccount: function(req, res) {
         // LOAD EXISTING DATA  
        var username = req.session.username;
    
        var projection = 'email username password birthdate pfp';

        db.findOne(User, {username: username}, ['username', 'password', 'email', 'birthdate', 'pfp'], function(result) {

            if (result != null) {

                if (result.birthdate != null)
                {
                    var formattedDate = formatDate(result.birthdate);
                }
                else {
                    var formattedDate = null;
                }
                
                var details = {
                    username: result.username, 
                    email: result.email,
                    password: result.password,
                    birthdate: formattedDate,
                    pfp: result.pfp
                };
                res.render('account', details);
            }
        });
    },

    postAccount: function(req, res) {

    },

    updateAccount: function(req, res) {
        var newUsername = req.query.username;
        var newEmail = req.query.email;
        var newBirthdate = req.query.birthdate;

        var oldUsername = req.session.username;
        
        var newDetails = {}

        if (newUsername){
            newDetails.username = newUsername;

            req.session.username = newUsername;

            // CHANGE NAME ON EVENTS LMAOO
            
            db.findMany(Event, {creator: oldUsername}, ['creator'], function(result) {
    
                
                for (r of result) {
                    var editedName = {
                        creator: newUsername
                    }
                    db.updateOne(Event, {creator: oldUsername}, editedName, function(result) {
                    });
                }
            }); 
        }

        if (newEmail)
            newDetails.email = newEmail;
        
            if (newBirthdate)
            newDetails.birthdate = newBirthdate;
        
        db.findOne(User, {username: oldUsername}, ['username', 'email', 'birthdate'], function(result) {
            db.updateOne(User, {username: oldUsername}, newDetails, function(result) {
                res.send("1");
            });            
        });     
    },

    updatePassword: function(req, res){
        var username = req.session.username;
        var password = req.query.currPassword;
        var newPassword = req.query.newPassword;

        // GET USER
        db.findOne(User, {username: username}, ['username', 'password'], function(result) {
            if (result != null){
                var currentUser = {
                    username: result.username,
                    password: result.password
                }

                bcrypt.compare(password, result.password, function(err, equal) {
                    if (equal){
                        // CONFIRM PASSWORD IS VALID
                        bcrypt.hash(newPassword, saltRounds, function(err, hash) {
                            var updated = {
                                username: username,
                                password: hash
                            };

                            // UPDATE DATABASE
                            db.updateOne(User, {username: username}, updated, function(result) {
                                res.send("1");
                            });
                        });
                    }
                    else
                    {
                        // ERROR. RETURN TO ACCOUNT
                        res.send("0");
                    } 
                });
            }
        });
    },

    uploadImage: function(req, res) {
      
        var update = { 
            pfp: req.session.username+"Image.png"
        };
        
        var username = req.session.username;
        
        db.updateOne(User, {username: username}, update, function(result) {
            return res.redirect('/account');
        });    
    },

    deleteAccount: function(req, res) {
        
        
        db.deleteOne(User, {username: req.session.username}, function(result){});
        var username = req.session.username;
        db.deleteMany(Event, {creator: username}, function(result){});
        return res.redirect('/logout');

    }
}

module.exports = accountController;
