const express = require('express');
const hbs = require('hbs');
const routes = require('./routes/routes.js');
const db = require('./models/db.js')
const dotenv = require('dotenv');
// const fs = require('fs');
const bodyParser = require('body-parser');
const path = require('path');
const session = require('express-session');
const mongoose = require('mongoose');
const MongoStore = require('connect-mongo')(session);

const app = express();
app.set('view engine', 'hbs');
hbs.registerPartials(__dirname + '/views/partials');
app.use(bodyParser.urlencoded({extended:false}));
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
    'secret': '2021-G04',
    'resave': false,
    'saveUninitialized': false,
    store: new MongoStore({mongooseConnection: mongoose.connection})
}));

dotenv.config();
port = process.env.PORT || 3000;
hostname = process.env.HOSTNAME || "0.0.0.0";

app.use('/', routes);
app.use(function (req, res) {
    res.send('error');
});

db.connect();

app.listen(port, hostname, function() {
    console.log('Server is running at:');
    console.log('http://' + hostname + ':' + port)
});
