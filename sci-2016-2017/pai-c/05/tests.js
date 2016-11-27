describe('Testing quadratic function', function () {
  it('should return false when passing wrong parameters', function () {
    quadratic("jeden", "dwa", "trzy", function (res) {
      expect(res).to.be.equal(false)
    })
  })

  it('should return an array when passing parameters that result in delta > 0', function () {
    quadratic(1, 4, 2, function (res) {
      expect(res).to.be.an('object')
    })
  })

  it('should return a number when passing parameters that result in delta = 0', function () {
    quadratic(5, 20, 20, function (res) {
      expect(res).to.be.a('number')
    })
  })

  it('should return false when passing parameters that result in delta < 0', function () {
    quadratic(420, 13, 37, function (res) {
      expect(res).to.be.equal(false)
    })
  })

  it('should return correct value when passing float numbers', function () {
    var a = 1.5
    var b = 3
    var c = 1.5

    quadratic(a, b, c, function (res) {
      expect(res).to.be.equal(-b / (2 * a))
    })
  })

  it('should return false when parameter is missing', function () {
    quadratic(1, 2, undefined, function (res) {
      expect(res).to.be.equal(false)
    })
  })

  it('should return correct result when passing object and callback', function () {
    quadratic({
      a: 1,
      b: 2,
      c: 1
    }, function (res) {
      expect(res).to.be.equal(-1)
    })
  })

  it('should return correct results for generated parameters', function () {
    var params = []
    var correct = 0
    var incorrect = []
    var c = 0
    for(var i = 0; i < 10000; i++) {
      var param = {
        a: Number((Math.random() * 10000).toFixed(0)) + 1,
        b: Number((Math.random() * 10000).toFixed(0)) + 1,
        c: Number((Math.random() * 10000).toFixed(0) + 1)
      }

      param.delta = Math.pow(param.b, 2) - 4 * param.a * param.c

      if (param.delta > 0) param.result = {
        x1: -param.b - Math.sqrt(param.delta) / (2 * param.a),
        x2: -param.b + Math.sqrt(param.delta) / (2 * param.a)
      }
      else if (param.delta === 0) param.result = -param.b / (2 * param.a)
      else param.result = false

      params.push(param)
    }

    for(i in params) {
      quadratic(params[i].a, params[i].b, params[i].c, function (res) {
        if (typeof res === 'object'
          && res.x1 === params[i].result.x1
          && res.x2 === params[i].result.x2) correct++
        else if (typeof res === 'number'
          && res === params[i].result) correct++
        else if (res === params[i].result) correct++
        else incorrect.push({test: params[i], function: res})

        if (++c >= params.length) done()
      })
    }

    function done () {
      expect(correct).to.be.equal(params.length)
    }
  })
})