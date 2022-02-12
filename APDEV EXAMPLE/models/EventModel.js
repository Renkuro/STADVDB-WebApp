var mongoose = require('mongoose');

var EventSchema = new mongoose.Schema({
    classification: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        required: true
    },
    title: {
        type: String,
        required: true
    },
    creator: {
        type: String,
        required: true
    },
    invited: {
        type: [{username: {type: String, required:false},
                response: {type: Boolean, required:false}}],
        required: false
    },
    description: {
        type: String,
        required: false
    }
});

module.exports = mongoose.model('Event', EventSchema);
