const express = require('express');
const multer = require('multer');


const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/uploads')
    },
    filename: (req, file, cb) => {
        const { originalname } = file;
        cb(null, file.fieldname+".png");
    }
})

const upload = multer({ storage});

const controller = require('../controllers/controller.js');
const signupController = require('../controllers/signupController.js');
const loginController = require('../controllers/loginController.js');
const appController = require('../controllers/appController.js');
const accountController = require('../controllers/accountController.js');
const aboutController = require('../controllers/aboutController.js');
const validation = require('../helpers/validation.js');

const app = express();

app.get('/', controller.getIndex);
app.get('/index', controller.getIndex);
// registration
app.get('/register', signupController.getSignup);
app.get('/getCheckEmail', signupController.getCheckEmail);
app.get('/getCheckUsername', signupController.getCheckUsername);
// login
app.get('/login', loginController.getLogin);
// application
app.get('/app', appController.getApp);
app.post('/app', appController.postApp);
app.post('/appnew', validation.signupValidation(), appController.postAppNew);
app.get('/getEvents', appController.loadData);
app.get('/addEvent', appController.addEvent);
app.get('/findEvents', appController.findEvents);
app.get('/editSelfEvent', appController.editSelfEvent);
app.get('/editInviteResponse', appController.editInviteResponse);
app.get('/delEvent', appController.delEvent);
app.get('/logout', appController.logout);
app.get('/exists', appController.checkExists);
// account
app.get('/account', accountController.getAccount);
app.post('/account', accountController.postAccount);
app.get('/updateAccount', accountController.updateAccount);
app.get('/updatePassword', accountController.updatePassword);
app.post('/uploadImage', upload.any(), accountController.uploadImage);
app.get('/deleteAccount', accountController.deleteAccount);
// about
app.get('/about', aboutController.about);

module.exports = app;
