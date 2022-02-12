const { json } = require('express');
var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({
    email: {
        type: String,
        required: true,
        unique: true
    },
    username: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    birthdate: {
        type: Date,
        required: false
    },
    pfp: {
        type: String,
        required: false
    }
});

module.exports = mongoose.model('User', UserSchema);
