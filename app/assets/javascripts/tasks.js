$(document).ready(function() {
    $(function() {

        $(".new_task,.edit_task").validate({
            ignore: ".ignore",
            rules: {
                "task[mark]":{
                    required: true,
                    pattern: /^[1-5]*$/,
                    maxlength: 1

                },
                "task[time]":{
                    required: true,
                    pattern: /^[0-9]*$/,
                    maxlength: 3
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });

});

