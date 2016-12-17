$(function() {
    $("#dbv").validate({
        ignore: ".ignore",
        rules: {
            user_name:{
                required: true
            },
            host:{
                required: true
            },
            db:{
                required: true
            },
            gemn:{
                selectcheck: true
            },
            dtp:{
                selectcheck: true
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
    jQuery.validator.addMethod('selectcheck', function (value) {
        return (value != '0');
    }, "Выберите из списка");
});