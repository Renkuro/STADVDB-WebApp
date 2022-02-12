

const aboutController = {
    about: function(req, res) {
        if (req.session.username != null)
            res.render('about', {app:true});
        else
            res.render('about', {app:false});
    }
}

module.exports = aboutController;
