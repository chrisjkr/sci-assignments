function pierwszyKlik () {
  alert('Wywołano funkcję pierwszyKlik()')
}

function przeladowanie () {
  location.reload()
}

function kolorowanie () {
  document.body.style.backgroundColor = 'green'
}

function isDivisible (a, b) {
  return a % b === 0
}

function divisibleHandler () {
  if (isDivisible(document.getElementById('pa').value, document.getElementById('pb').value)) {
    document.getElementById('poutput').innerHTML = '<p>Jest podzielna</p>'
  } else {
    document.getElementById('poutput').innerHTML = '<p>Nie jest podzielna</p>'
  }
}

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

function quadraticHandler () {
  quadratic(
    Number(document.getElementById('qa').value),
    Number(document.getElementById('qb').value),
    Number(document.getElementById('qc').value), function (res) {
      if (res) {
        if (typeof res === 'object') return document.getElementById('qoutput').innerHTML = '<p>x1 =  ' + res.x1 + '</p><p>x2 = ' + res.x2 + '</p>'
        else return document.getElementById('qoutput').innerHTML = '<p>x = ' + res + '</p>'
      } else return document.getElementById('qoutput').innerHTML = '<p>Brak pierwiastków.</p>'
    })
}

// 12. komentarz w jednej linii
/*
komentarz
w
wielu
liniach
 */