$(document).ready(function(){
    var s = $('#ec').prop('checked');
    $('#ec').click(function (e) {
        if (s === true) {
        $('#e').css('display', 'inline');
        console.log("elo");
    }
    });
});
