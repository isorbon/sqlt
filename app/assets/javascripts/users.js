$(function() {
    $(".edit_user, .new_user").validate({
        ignore: ".ignore",
        rules: {

            "user[fname]": {
                required: true,
                minlength: 2,
                pattern: /^[a-zA-Zа-яА-Я]*$/
            },
            "user[lname]": {
                required: true,
                minlength: 3,
                pattern: /^[a-zA-Zа-яА-Я]*$/
            },
            "user[password]": {
                required: true,
                minlength: 5,
                maxlength:15,
                pattern: /^[a-zA-Z0-9]*$/
            },"user[login]":{
                required: true,
                minlength: 5,
                maxlength:15,
                pattern: /^[a-zA-Z0-9]*$/
            },

            password_req: {
                required: true,
                minlength: 5,
                pattern: /^[a-zA-Z0-9]*$/,
                equalTo: "#user_password"
            },
            "user[status_user]"
                :
            {required: true,
                pattern: /^[0-1]*$/,
                maxlength:1
            },
            "hiddenRecaptcha": {
                required: function() {
                    if(grecaptcha.getResponse() == '') {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});
function getinfo_() {
    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: 'um',
        dataType: "html",
        success: (function(responce) {
            $('#docx').html(responce)
            return responce; })
    });
}