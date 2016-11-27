function output () {
  var inputs = document.getElementsByTagName('input')
  var totalLength = 0

  for (var i = 0; i < inputs.length; i++) {
    totalLength += inputs[i].value.length
  }

  document.getElementById('odometer').innerHTML = totalLength
}

