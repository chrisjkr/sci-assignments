$(document).ready(function(){
    $('#ec').change(function () {
        if($(this).prop('checked') === true) {
            $('#ef').css('display', 'inline');
        } else {
            $('#ef').css('display', 'none');
        }
    });
    
    $('#ac').change(function(){
       if($(this).prop('checked') === true) {
           $('#af').css('display', 'none');
       } else {
           $('#af').css('display', 'inline');
       }
    });
    
    $('#2').change(function(){
       if($(this).prop('checked') === true) {
           $('#r').html('Akceptuję regulaminy konkursu 1 i 2');
       } else {
           $('#r').html('Akceptuję regulamin konkursu 1');
       }
    });
});
