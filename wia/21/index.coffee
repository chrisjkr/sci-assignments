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