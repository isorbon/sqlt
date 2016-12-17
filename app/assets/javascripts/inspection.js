function idif_(ask,id) {
    get_($(ask).val(),id);
}
function get_(ask,id) {
    $.ajax({
        type: "POST",
         url: "/query",
         data:{ query: ask},
        success: (function(responce) {
            $(id).html(responce)
            return responce;
        })
    });
}
if(jQuery) (function(){

    $.extend($.fn, {

        rightClick: function(handler) {
            $(this).each( function() {
                $(this).mousedown( function(e) {
                    var evt = e;
                    $(this).mouseup( function() {
                        $(this).unbind('mouseup');
                        if( evt.button == 2 ) {
                            handler.call( $(this), evt );
                            return false;
                        } else {
                            return true;
                        }
                    });
                });
                $(this)[0].oncontextmenu = function() {
                    return false;
                }
            });
            return $(this);
        },

        rightMouseDown: function(handler) {
            $(this).each( function() {
                $(this).mousedown( function(e) {
                    if( e.button == 2 ) {
                        handler.call( $(this), e );
                        return false;
                    } else {
                        return true;
                    }
                });
                $(this)[0].oncontextmenu = function() {
                    return false;
                }
            });
            return $(this);
        },

        rightMouseUp: function(handler) {
            $(this).each( function() {
                $(this).mouseup( function(e) {
                    if( e.button == 2 ) {
                        handler.call( $(this), e );
                        return false;
                    } else {
                        return true;
                    }
                });
                $(this)[0].oncontextmenu = function() {
                    return false;
                }
            });
            return $(this);
        },

        noContext: function() {
            $(this).each( function() {
                $(this)[0].oncontextmenu = function() {
                    return false;
                }
            });
            return $(this);
        }

    });

})(jQuery);

$(window).ready(function() {
        $(document).rightClick( function(e) {
        return false;
    });
    function hot(n) {
        $(window).bind('keydown', function(e) {
            if(e.ctrlKey && (e.which ==n)) {
                e.preventDefault();
                return false;
            }

        });
    }
    hot(83);
    hot(80);
    hot(87);
    hot(79);

});
