const db = require('../models/db.js');
const Transaction = require('../models/TransactionModel.js');

const controller = {

    getFavicon: function (req, res) {
        res.status(204);
    },

    /*
    TODO:   This function is executed when the client sends an HTTP GET
            request to path `/`. This displays `index.hbs` with all
            transactions currently stored in the database.
    */
    getIndex: function(req, res) {
        // your code here
         // This is to load the page initially
         db.findMany(Transaction, null, {name: 1, refno: 1, amount: 1}, function(result) {
            res.render('index', {result});
        });
    },

    /*
    TODO:   This function is executed when the client sends an HTTP GET
            request to path `/getCheckRefNo`. This function checks if a
            specific reference number is stored in the database. If the number
            is stored in the database, it returns an object containing the
            reference number, otherwise, it returns an empty string.
    */
    getCheckRefNo: function(req, res) {
        
        var refno = req.query.refno;

        db.findOne(Transaction, {refno: refno}, 'refno', function (result) {
            res.send(result);
        });

    },

    /*
    TODO:   This function is executed when the client sends an HTTP GET
            request to path `/getAdd`. This function adds the transaction
            sent by the client to the database, then appends the new
            transaction to the list of transactions in `index.hbs`.
    */
    getAdd: function(req, res) {
        // your code here
        console.log(req.query);

        var name = req.query.name;
        var refno = req.query.refno;
        var amount = req.query.amount;

        var transaction = {
                name: name,
                refno: refno,
                amount: amount
        };


        db.insertOne(Transaction, transaction, function(flag) {
            if(flag) {
                res.render('partials\\card', {name: name, refno: refno, amount:amount}, function(err, html) {
                    res.send(html);
                });
            }
        });

        
    },

    /*
    TODO:   This function is executed when the client sends an HTTP GET
            request to path `/getDelete`. This function deletes the transaction
            from the database, then removes the transaction from the list of
            transactions in `index.hbs`.
    */
    getDelete: function (req, res) {
        var refno = req.query.refno;

        db.deleteOne(Transaction, {refno: refno}, function(flag) {
            //res.send(flag);
        });
    }

}

module.exports = controller;
