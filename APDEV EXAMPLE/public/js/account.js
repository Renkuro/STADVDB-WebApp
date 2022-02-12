$(document).ready(function() {

    // returns true when email, username are not empty.
    function isFilled() {
        var email = validator.trim($('#emailBox').val());
        var username = validator.trim($('#nameBox').val());

        var emailEmpty = validator.isEmpty(email);
        var usernameEmpty = validator.isEmpty(username);

        return !emailEmpty && !usernameEmpty;

    }

    // validate email; return true if email is unique
    function isValidEmail(field, callback) {
        var email = validator.trim($('#emailBox').val());
        //return callback(true);

        $.get('/getCheckEmail', {email: email}, function(result) {
            
            if (result.email != email) {
                return callback(true);
            }
            else {
                return callback(false);
            }
        });

    }

    // return true when the username is unique
    function isValidUsername(field, callback) {
        var username = validator.trim($('#nameBox').val());
        $.get('/getCheckUsername', {username: username}, function(result) {

            if (result.username != username) {
                return callback(true);
            }
            else {
                
                return callback(false);
            }
        });
    }

    // return true when the bday is valid
    function isValidBday(field, callback) {
        return callback(true);
    }

    // FORM VALIDATION
    function validateField(field) {
        var value = validator.trim(field.val());
        var empty = validator.isEmpty(value);

        // TEXT BOX SHOULDN'T BE EMPTY
        if(empty) {
            // DISABLE SAVE CHANGES BUTTON
            $("#saveChanges").prop('disabled', true);
        }
        else
        {
            $("#saveChanges").prop('disabled', false);        
        }
    }

    // VALIDATION FOR EMAIL
    $('#emailBox').change(function() {
        validateField($('#emailBox'));
    });

    // VALIDATION FOR USERNAME
    $('#nameBox').change(function() {
        validateField($('#nameBox'));
    });

    // ENABLE TEXTBOXES
    $("#editName").click(function(){
        $("#nameBox").prop("readonly", false);
      }); 

    $("#editEmail").click(function(){
        $("#emailBox").prop("readonly", false);
    }); 

    $("#editBday").click(function(){
        $("#bdayBox").prop("readonly", false);
    }); 

    // SUBMIT button
    $("#submit").click(function(){
        // CHECK IF ALL FIELDS ARE FILLED
        var filled = isFilled();
        $('#saveChange .close').click();
        $("#nameBox").prop("readonly", true);
        $("#emailBox").prop("readonly", true);
        $("#bdayBox").prop("readonly", true);

        // CHECK ALL LMAO
        isValidEmail($("#emailBox").val(), function (validEmail) {
            isValidUsername($('#nameBox').val(), function (validUsername) {
                isValidBday($('#bdayBox').val(), function (validBday) {

                    if (validEmail)
                        email = $("#emailBox").val();
                    else{
                        email = null;
                        //INSERT ERROR LOGS
                    }

                    if (validUsername)
                        username = $("#nameBox").val();
                    else{
                        username = null;
                        //INSERT ERROR LOGS
                    }
    
                    if (validBday)
                        birthdate =  $("#bdayBox").val();
                    else{
                        birthdate = null;
                        //INSERT ERROR LOGS
                    }
                    

                    $.get('/updateAccount', {username: username, email: email, birthdate: birthdate}, function(res) {
                    });
                });
            });
        });
    });

    // return true when the password is at least 8 characters
    function isValidPassword(field) {
        var validPassword = false;
        var password = validator.trim($('#newPassword').val());
        var isValidLength = validator.isLength(password, {min: 8});
        if (isValidLength) {
            validPassword = true;
        }
        else {
            validPassword = false;
        }
        return validPassword;
    }

    $('#changePW').prop('disabled', true); 

    // DISABLE SUBMIT BUTTON WHEN CONFIRMPW and NEWPW AREN'T GOOD
    $('#confirmPassword').keyup(function() {
        if (isValidPassword($('#newPassword')) && ($('#confirmPassword').val() == $('#newPassword').val()))
        {
            $('#changePW').prop('disabled', false);
        } else
            $('#changePW').prop('disabled', true);
        
    });

    $('#newPassword').keyup(function() {
        if (isValidPassword($('#newPassword')) && ($('#confirmPassword').val() == $('#newPassword').val()))
        {
            $('#changePW').prop('disabled', false);
        } else
            $('#changePW').prop('disabled', true);
        
    });

    // CHANGE PW BUTTON
    $("#changePW").click(function() {

        // Check validity of current password
        currPassword = $('#currentPassword').val();
        newPassword = $('#newPassword').val();

        $.get('/updatePassword', {currPassword: currPassword,  newPassword: newPassword}, function(res) {
            if (res == 0)
            {
                // Wrong input of current password
                $('#errorPassword').text('Password invalid.');
            }
            else 
                $('#pwChange .close').click();
        });
    });

    // DELETE BUTTON
    $("#delete").click(function(){
        $('#deleteAccount .close').click();
        $.get('/deleteAccount', {username: $("#nameBox").text()}, function(res) {});
        $('#logoutBypass').click();
    });
});
