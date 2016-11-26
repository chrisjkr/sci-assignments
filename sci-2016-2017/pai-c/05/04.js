function quadratic (a, b, c, done) {
  if (isNaN(a) || isNaN(b) || isNaN(c) || a === 0) return done(false)

  if (typeof a === 'object') {
    var done = b
    b = a.b
    c = a.c
    a = a.a
  }

  var delta = Math.pow(b, 2) - 4 * a * c
  if (delta < 0) return done(false)
  if (delta === 0) return done(-b / (2 * a))
  if (delta > 0) return done({
    x1: -b - Math.sqrt(delta) / (2 * a),
    x2: -b + Math.sqrt(delta) / (2 * a)
  })
}

function formHandler () {
  quadratic(
    Number(document.getElementById('a').value),
    Number(document.getElementById('b').value),
    Number(document.getElementById('c').value), function (res) {
    if (res) {
      if (typeof res === 'object') return document.getElementById('output').innerHTML = '<p>x1 =  ' + res.x1 + '</p><p>x2 = ' + res.x2 + '</p>'
      else return document.getElementById('output').innerHTML = '<p>x = ' + res + '</p>'
    } else return document.getElementById('output').innerHTML = '<p>Brak pierwiastków.</p>'
  })
}