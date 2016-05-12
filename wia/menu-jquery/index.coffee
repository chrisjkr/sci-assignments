$(document).ready ->
  $('.dropitm8').hover (->
    $(this).children('.sub').slideDown 150
    ), (->
      $(this).children('.sub').slideUp 150
  )
    