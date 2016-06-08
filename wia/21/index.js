// Generated by CoffeeScript 1.10.0
(function() {
  $(document).ready(function() {
    $('.b').hover(function() {
      return $.ajax({
        type: 'GET',
        url: $(this).attr('id') + '.txt',
        success: function(text) {
          return $('#text').text(text);
        }
      });
    });
    $('.b2').hover(function() {
      return $.ajax({
        type: 'GET',
        dataType: 'xml',
        url: $(this).attr('id') + '.xml',
        success: function(xml) {
          return $('#xml').text($(xml).find("text").text());
        }
      });
    });
    $.ajax({
      type: 'GET',
      dataType: 'xml',
      url: 'books.xml',
      success: function(xml) {
        $(xml).find('books book').each(function(i) {
          return $('#books').append('<li class="book" id="book' + i + '"><a href="#">' + $(this).find('title').text() + '</a></li>');
        });
        return $('.book').click(function() {
          var id;
          id = Number($(this).attr('id').slice(4));
          return $(xml).find('books book').each(function(i) {
            if (i === id) {
              return $('#book').html("<p>Title: " + ($(this).find('title').text()) + "\n<p>Author: " + ($(this).find('author').text()) + "\n<p>Pages: " + ($(this).find('pages').text()) + "\n<p>Description: " + ($(this).find('description').text()));
            }
          });
        });
      }
    });
    $('#send').click(function() {
      if ($('#number').val().length) {
        return $.get('number.php', {
          number: $('#number').val()
        }).done(function(data) {
          return alert(data);
        });
      }
    });
    return $('.cat').click(function() {
      return $.get('news.php', {
        id: Number($(this).attr('id').slice(3))
      }).done(function(data) {
        var $xml;
        $('#news').empty();
        $xml = $($.parseXML(data));
        return $xml.find('news article').each(function(i) {
          var img;
          img = $(this).find('img').text();
          return $('#news').append('<a href="' + img + '"><img height="100" src="' + img + '">');
        });
      });
    });
  });

}).call(this);
