$(function() {

    $(".edit_test,.new_test").validate({
        ignore: ".ignore",
        rules: {
            "test[name]":{
                required: true
            },
            "test[description]":{
                required: true
            },
            "test[start_t]":{
                required: true
            },

            "test[password]":{
                required: true,
                minlength: 5,
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });

});