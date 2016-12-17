$(function() {
    $(".login-form").validate({
        ignore: ".ignore",
        rules: {
            password: {
                required: true,
                minlength: 5,
                maxlength:15,
                pattern: /^[a-zA-Z0-9]*$/
            },login:{
                required: true,
                minlength: 5,
                maxlength:15,
                pattern: /^[a-zA-Z0-9]*$/
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