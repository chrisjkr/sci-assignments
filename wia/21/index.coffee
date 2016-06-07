$(document).ready ->
  $('.b').hover ->
    $.ajax {
      type: 'GET'
      url: $(this).attr('id') + '.txt'
      success: (text) ->
        $('#text').text text # :v
    }

  $('.b2').hover ->
    $.ajax {
      type: 'GET'
      dataType: 'xml'
      url: $(this).attr('id') + '.xml'
      success: (xml) -> 
        $('#xml').text($(xml).find("text").text())
    }

  $.ajax {
    type: 'GET',
    dataType: 'xml'
    url: 'books.xml'
    success: (xml) ->
      $(xml).find('books book').each (i) ->
        $('#books').append '<li class="book" id="book' + i + '"><a href="#">' + $(this).find('title').text() + '</a></li>'

      $('.book').click ->
        id = Number($(this).attr('id').slice(4))
        $(xml).find('books book').each (i) ->
          if i is id
            $('#book').html """
              <p>Title: #{$(this).find('title').text()}
              <p>Author: #{$(this).find('author').text()}
              <p>Pages: #{$(this).find('pages').text()}
              <p>Description: #{$(this).find('description').text()}
            """
  }

  $('#send').click ->
    if $('#number').val().length
      $.get('number.php', {number: $('#number').val()})
      .done (data) ->
        alert data