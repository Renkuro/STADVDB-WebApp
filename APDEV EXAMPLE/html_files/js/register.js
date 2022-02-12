$(document).ready(function () {
    var dateToday = new Date();

    // email must be unique
    $('#email').change(function() {
        var email = $('#email').val();

        $.get('/getCheckEmail', {email: email}, function(result) {
            if (result.email == email) {
                alert('This email already exists on our platform. Please enter a new unique one');
                $("#email").val("");
            }
        });
    });

    // password must be at least 8 characters
    $('#password').change(function() {
        var passwordLength = $("#password").val().length;
        if (passwordLength < 8) {
            alert('The password must be at least 8 characters long.');
            $("#password").val("");
        }
    });

    // username must be unique
    $('#username').change(function() {
        var username = $("#username").val();

        $.get('/getCheckUsername', {username: username}, function(result) {
            if (result.username == username) {
                alert('This username already exists on our platform. Please enter a new unique one');
                $("#username").val("");
            }
        });
    });

    // birthdate must be in the past
    $('#birthdate').change(function() {
        var dateToday = new Date();
        var birthdate = new Date($("#birthdate").val());
        if (birthdate >= dateToday) {
            alert("Birthdate should be a date before today.");
            $("#birthdate").val('');
        }
    });
})
