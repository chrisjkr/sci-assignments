$(document).ready ->
  window.requestAnimFrame = do ->
    window.requestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.oRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    (callback) ->
      window.setTimeout callback, 1000 / 60
  
  $canvas = $('#canvas')
  ctx = canvas.getContext '2d'
  W = 600
  H = 600
  canvas.width = W
  canvas.height = H
  ctx.fillRect 0, 0, W, H
  
  particles = []
  ball = {}
  paddles = []
  
  ball = {
    x: 50
    y: 50
    r: 5
    c: 'white'
    vx: 4
    vy: 8
    draw: ->
      ctx.beginPath()
      ctx.fillStyle = this.c
      ctx.arc this.x, this.y, this.r, 0, Math.PI * 2, false
      ctx.fill
  }
  
  class Paddle
    constructor: (pos) ->
      @pos = pos
      h: 5
      w: 150
      x: W/2 - this.w/2
      y: (pos == 'top') ? 0 : H - this.h
      
  paddles.push new Paddle 'bottom'
  paddles.push new Paddle 'top'
  
  paintCanvas = ->
    ctx.fillStyle = 'black'
    ctx.fillRect 0, 0, W, H
    