$(document).ready(function () {

    // returns true when email, username, and password are not empty.
    function isFilled() {
        var email = validator.trim($('#email').val());
        var username = validator.trim($('#username').val());
        var password = validator.trim($('#password').val());

        var emailEmpty = validator.isEmpty(email);
        var usernameEmpty = validator.isEmpty(username);
        var passwordEmpty = validator.isEmpty(password);

        return !emailEmpty && !usernameEmpty && !passwordEmpty;

    }

    // return true when the email is unique
    function isValidEmail(field, callback) {
        var email = validator.trim($('#email').val());
        $.get('/getCheckEmail', {email: email}, function(result) {

            if (result.email != email) {
                return callback(true);
            }
            else {
                if (field.is($('#email'))) {
                    alert('This email already exists on our platform. Please enter a new unique one');
                    $("#email").val("");
                }
                return callback(false);
            }
        });
    }
    // return true when the username is unique
    function isValidUsername(field, callback) {
        var username = validator.trim($('#username').val());
        $.get('/getCheckUsername', {username: username}, function(result) {

            if (result.username != username) {
                console.log("a");
                return callback(true);
            }
            else {
                if (field.is($('#username'))) {
                    alert('This username already exists on our platform. Please enter a new unique one');
                    $("#username").val("");
                }
                return callback(false);
            }
        });
    }

    // return true when the password is at least 8 characters
    function isValidPassword(field) {
        var validPassword = false;
        var password = validator.trim($('#password').val());
        var isValidLength = validator.isLength(password, {min: 8});
        if (isValidLength) {
            validPassword = true;
        }
        else {
            if (field.is($('#password'))) {
                alert('The password must be at least 8 characters long.');
                $("#password").val("");
            }
        }
        return validPassword;
    }

    //
    function validateField(field) {
        var value = validator.trim(field.val());
        var empty = validator.isEmpty(value);

        if(empty) {
            field.prop('value', '');
        }
        var filled = isFilled();
        var validPassword = isValidPassword(field);

        isValidEmail(field, function (validEmail) {
            isValidUsername(field, function (validUsername) {
                if (filled && validEmail && validUsername && validPassword) {
                    $("#submit").prop('disabled', false);
                }
                else {
                    $("#submit").prop('disabled', true);
                }
            });
        });
    }

    var dateToday = new Date();

    // email must be unique
    $('#email').change(function() {
        validateField($('#email'));
        // var email = $('#email').val();
        //
        // $.get('/getCheckEmail', {email: email}, function(result) {
        //     if (result.email == email) {
        //         alert('This email already exists on our platform. Please enter a new unique one');
        //         $("#email").val("");
        //     }
        // });
    });

    // password must be at least 8 characters
    $('#password').change(function() {
        validateField($('#password'));
        // var passwordLength = $("#password").val().length;
        // if (passwordLength < 8) {
        //     alert('The password must be at least 8 characters long.');
        //     $("#password").val("");
        // }
    });

    // username must be unique
    $('#username').change(function() {
        validateField($('#username'));
        // var username = $("#username").val();
        //
        // $.get('/getCheckUsername', {username: username}, function(result) {
        //     if (result.username == username) {
        //         alert('This username already exists on our platform. Please enter a new unique one');
        //         $("#username").val("");
        //     }
        // });
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
