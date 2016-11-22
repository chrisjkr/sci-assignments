$(document).ready ->
  $in = $('#in')
  $a = $('#a')
  $kp = $('#kp')
  
  $in.change ->
    if !$in.val().length
      $toast = $('<span class="toast-error">Brak danych w polu Imię i nazwisko.</span>')
      Materialize.toast $toast, 2000, 'rounded'
  
  $a.change ->
    if !$a.val().length
      $toast = $('<span class="toast-error">Brak danych w polu Adres.</span>')
      Materialize.toast $toast, 2000, 'rounded'
  
  $kp.change ->
    if !$kp.val().length
      $toast = $('<span class="toast-error">Brak danych w polu Kod pocztowy.</span>')
      Materialize.toast $toast, 2000, 'rounded'
      
  $kp.keyup ->
    $kp.css 'background-color', 'none'
    if $kp.val().length >= 6 and $kp.val()[2] == "-"
      $kp.css 'background-color', 'green'