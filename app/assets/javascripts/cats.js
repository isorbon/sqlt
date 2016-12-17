$(function() {
    $(".new_cat,.edit_cat").validate({
        ignore: ".ignore",
        rules: {
            "cat[name]":{required: true }
        },
        submitHandler: function(form) {
            form.submit();  }
    });});