const controller = {
    getIndex: function(req, res) {
        console.log(req.session.username);
        if (req.session.username != null)
            res.render('app', {username: req.session.username});
        else
            res.render('index');
    }
}

module.exports = controller;
