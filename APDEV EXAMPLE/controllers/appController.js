const db = require('../models/db.js');
const User = require('../models/UserModel.js');
const Event = require('../models/EventModel.js');
const { validationResult } = require('express-validator');
const bcrypt = require('bcrypt');
const saltRounds = 10;

function formatDate(date) {
    return date.getFullYear().toString() + '-' + (date.getMonth() + 1).toString().padStart(2, 0) + '-' + date.getDate().toString().padStart(2, 0);
}

const appController = {
    // ajax for getting the user and all events
    loadData: function(req, res) {
        var month = req.query.month;
        var year = req.query.year;
        var username = req.query.username;

        db.findOne(User, {username: username}, ['email', 'username', 'password', 'birthdate'], function (result) {
            var currentUser = {
                username: result.username,
                email: result.email,
                password: result.password,
                birthdate: result.birthdate
            }
            date1 = formatDate(new Date(year,month, 1));
            date2 = formatDate(new Date(year,parseInt(month, 10)+1, 0));
            // find all events related to the logged in user
            // get the events created by the logged in user from db or where the user was invited
            // that are within the month and year specified
            db.findMany(Event,{ $and: [{$or: [{"invited.username": username}, {creator: username}]}, {date: {$gte: date1, $lte: date2}}]},
            ['_id', 'classification', 'date', 'title', 'creator', 'description', 'invited'], function (result) {
                var events = [];
                if (result != null) {
                    for (r of result) {
                        events.push({
                            id: r._id,
                            classification: r.classification,
                            date: r.date,
                            title: r.title,
                            creator: r.creator,
                            description: r.description,
                            invited: r.invited
                        });
                    }

                    // compile all data to be rendered by app.hbs
                    var details = {
                        user: currentUser,
                        events: events
                    };
                    res.send(details);
                }
            });
        });
    },
    getApp: function(req, res) {
        if (req.session.username) {
            res.render('app', {username: req.session.username});
        }
    },

    postApp: function(req, res) {
        var username = req.body.username;
        var password = req.body.password;

        // get the logged in user from db
        db.findOne(User, {username: username}, ['username', 'password'], function (result) {
        if (result == null) {
            res.render('login', {error: "Username or password is incorrect."});
        }
        else {
            var currentUser = {
                username: result.username,
                password: result.password,
            }

            bcrypt.compare(password, result.password, function(err, equal) {
                if (equal) {
                    // session
                    req.session.username = currentUser.username;
                    res.render('app', {username: username});
                }
                else {
                    res.render('login', {error: "Username or password is incorrect."});
                }
            });
        }
        });
    },

    postAppNew: function(req, res) {
        var errors = validationResult(req);
        if (!errors.isEmpty()) {
            errors = errors.errors;
            var details = {};
            for(i = 0; i < errors.length; i++)
                details[errors[i].param + 'Error'] = errors[i].msg;
            res.send(details);
        }

        else {
            var email = req.body.email;
            var username = req.body.username;
            var password = req.body.password;
            var birthdate = req.body.birthdate;
            var pfp = "defaultImage.png";
            
            bcrypt.hash(password, saltRounds, function(err, hash) {
                var account = {
                    email: email,
                    username: username,
                    password: hash,
                    birthdate: birthdate,
                    pfp: pfp
                };
                // session
                req.session.username = account.username;
                db.insertOne(User, account, function(flag) {

                });
                res.render('app', {username: username});
            });
        }
    },
    addEvent: function(req, res) {
        // get all inserted data
        var classification = 'user';
        var date = req.query.date;
        var title = req.query.title;
        var creator = req.query.creator;
        var description = req.query.description;
        var invited = req.query.invited;

        // form them into an object
        var newEvent = {
            classification: classification,
            date: date,
            title: title,
            creator: creator,
            description: description,
            invited: invited
        };

        db.insertOne(Event, newEvent, function(flag) {
            res.send("1");
        });
    },

    editSelfEvent: function (req, res) {
        var id = req.query.id;
        var title = req.query.title;
        var description = req.query.desc;
        var invited = req.query.invited;

        // get invite details of existing event from db
        db.findOne(Event, {_id: id}, ['invited'], function(result) {

            var invitedUpdate = [];
            if (invited != undefined) {
                for (i of invited) {
                    r = result.invited.find((o) => {return o["username"] === i});
                    // if invited is in result.invited, keep the current invitation response
                    if (r != null) {
                        iusername = r.username;
                        response = r.response;
                    }
                    // else if invited is not in result.invited, add a new invitation with response false
                    else {
                        iusername = i;
                        response = false;
                    }
                    var invite = {username: iusername, response: response};
                    invitedUpdate.push(invite);
                    // else if someone in result.invited but not in invited, that person will not be added
                }
            }
            

            var editedEvent = {
                title: title,
                description: description,
                invited: invitedUpdate
            }

            db.updateOne(Event, {_id: id}, editedEvent, function(result) {
                res.send('1');
            });
        });
    },

    editInviteResponse: function (req, res) {
        var id = req.query.id;
        var invited = req.query.username;
        var response = req.query.response;

        db.findOne(Event, {_id: id}, ['invited'], function(result) {
            var r = result.invited.find((o) => {return o["username"] === invited});
            var rIndex = result.invited.findIndex((i) => {return i["username"] === invited});
            r.response = response;
            result.invited[rIndex] = r;
            var editedEvent = {
                _id: id,
                invited: result.invited
            }
            // find one event
            db.updateOne(Event, {_id: id}, editedEvent, function(result) {
                res.send('1');
            });
        });
    },

    findEvents: function(req, res) {
        var title = req.query.title;
        query = new RegExp(title, 'i');
        db.findMany(Event, {title: {$regex: query}}, ['_id', 'classification', 'date', 'title', 'creator', 'description', 'invited'],
        function (result) {
            var events = [];
            if (result != null) {
                for (r of result) {
                    events.push({
                        id: r._id,
                        classification: r.classification,
                        date: r.date,
                        title: r.title,
                        creator: r.creator,
                        description: r.description,
                        invited: r.invited
                    });
                }
                res.send(events);
            }
        });
    },

    delEvent: function(req, res) {
        var id = req.query.id;

        db.deleteOne(Event, {_id: id}, function(result) {
            res.send("1");
        });
    },

    logout: function(req, res) {
        req.session.destroy(function(err) {
            if (err) throw err;
            res.redirect('/');
        })
    },

    checkExists: function(req, res) {
        var username = req.query.username;
        db.findOne(User, {username: username}, 'username', function(result) {
            res.send(result);
        });
    }
}
module.exports = appController;
