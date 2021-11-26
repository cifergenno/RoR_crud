$( document ).ready(function() {
    console.log( "ready!" );
});

$("#modal-window").find(".modal-content").html("<%= j (render 'delete') %>");
$("#modal-window").modal();