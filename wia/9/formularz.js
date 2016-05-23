$(document).ready(function(){
  var width, height, result, queryLength, maxLength, left;
  $('#width').change(function(){
    width = $(this).val();
    height = $('#height').val();
    result = width * height;
    $('#wymiary').val(result);
  });

  $('#height').change(function(){
    width = $(this).val();
    height = $('#width').val();
    result = width * height;
    $('#wymiary').val(result);
  });

  $('#dzialka').change(function(){
    if($(this).prop('checked')){
      $('#kat').removeAttr('hidden');
    } else {
      $('#kat').attr('hidden', 'hidden');
    }
  });

  $('#odwierty').change(function(){
    if($(this).prop('checked')){
      $('#odw').removeAttr('hidden');
    } else {
      $('#odw').attr('hidden', 'hidden');
    }
  });

  maxLength = 500;
  $('#query').keyup(function(){
    queryLength = $(this).val().length;
    left = maxLength - queryLength;
    $('#counter').text(left);
    if(queryLength > 500){
      $('#counter').text('0');
      alert('Przekroczyłeś dozwoloną liczbę znakow')
    }
  });

  $('#send').click(function(){
    if (!$('#name').val() || !$('#lastName').val() || !$('#phone').val() || $('#phone').val().length < 9 || $('#query').val().length > 500) {
      console.log($('#query').val().length);
      alert('Wypełnij pola oznaczone *');
      return false;
    } else {
      return true;
    }
  });
})
