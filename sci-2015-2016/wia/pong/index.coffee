$(document).ready ->
  W = 700
  H = 600

  UpArrow = 38
  DownArrow = 40

  canvas = undefined
  ctx = undefined
  keystate = undefined
  
  counter = 0 # dla tła
  playerScore = 0
  aiScore = 0

  player = 
    x: null
    y: null
    width: 20
    height: 100
    update: ->
      if keystate[UpArrow]
        @y -= 7
      if keystate[DownArrow]
        @y += 7
      # aby paletka nie wychodziła poza ekran
      @y = Math.max(Math.min(@y, H - (@height)), 0)
    draw: ->
      ctx.fillRect @x, @y, @width, @height
      
  ai = 
    x: null
    y: null
    width: 20
    height: 100
    update: ->
      # pozycja
      dest = ball.y - ((@height - (ball.side)) * 0.5)
      # spowolnienie ruchu paletki
      @y += (dest - (@y)) * 0.1
      # upewniamy się, że paletka nie wychodzi poza ekran
      @y = Math.max(Math.min(@y, H - (@height)), 0)
    draw: ->
      ctx.fillRect @x, @y, @width, @height
      
  ball = 
    x: null
    y: null
    vel: null
    side: 20
    speed: 12
    serve: (side) ->
      r = Math.random()
      @x = if side == 1 then player.x + player.width else ai.x - (@side)
      @y = (H - (@side)) * r
      # obliczamy kąt odbicia piłki
      phi = 0.1 * Math.PI * (1 - (2 * r))
      # ustawiamy prędkość
      @vel =
        x: side * @speed * Math.cos(phi)
        y: @speed * Math.sin(phi)
    update: ->
      # aktualizujemy pozycję na podstawie zmiennych prędkości
      @x += @vel.x
      @y += @vel.y
      # sprawdzamy czy piłka wyszła poza ekran
      if 0 > @y or @y + @side > H
        # jak daleko w środku znajduje się piłka
        offset = if @vel.y < 0 then 0 - (@y) else H - (@y + @side)
        @y += 2 * offset
        # odwracamy prędkość pionową
        @vel.y *= -1
        
      # sprawdzamy czy jakieś osie się przecinają
      AABBIntersect = (ax, ay, aw, ah, bx, By, bw, bh) ->
        ax < bx + bw and ay < By + bh and bx < ax + aw and By < ay + ah

      # sprawdzamy czy występuje kolizja
      pdle = if @vel.x < 0 then player else ai
      if AABBIntersect(pdle.x, pdle.y, pdle.width, pdle.height, @x, @y, @side, @side)
        # ustawiamy x i obliczamy kąt odbicia
        @x = if pdle == player then player.x + player.width else ai.x - (@side)
        n = (@y + @side - (pdle.y)) / (pdle.height + @side)
        phi = 0.25 * Math.PI * (2 * n - 1)
        # obliczamy siłę odbicia i aktualizujemy prędkość
        smash = if Math.abs(phi) > 0.2 * Math.PI then 1.5 else 1
        @vel.x = smash * (if pdle == player then 1 else -1) * @speed * Math.cos(phi)
        @vel.y = smash * @speed * Math.sin(phi)
      # reset piłki jeśli jest poza ekranem oraz przyznanie punktów
      if 0 > @x + @side
        aiScore += 1000
        $('#aiScore').text 'Bot: ' + aiScore
        console.log 'Bot scored.'
        @serve if pdle == player then 1 else -1
      if @x > W
        playerScore += 1000
        $('#playerScore').text 'You: ' + playerScore
        console.log 'Player scored.'
        @serve if pdle == player then 1 else -1
    draw: ->
      ctx.fillRect @x, @y, @side, @side
      
  # start
  main = ->
    canvas = document.createElement('canvas')
    canvas.width = W
    canvas.height = H
    ctx = canvas.getContext('2d')
    document.body.appendChild canvas
    keystate = {}
    # odczytujemy przyciski
    document.addEventListener 'keydown', (evt) ->
      keystate[evt.keyCode] = true
      return
    document.addEventListener 'keyup', (evt) ->
      delete keystate[evt.keyCode]
      return
    init()

    mainLoop = ->
      update()
      draw()
      window.requestAnimationFrame mainLoop, canvas
      return

    window.requestAnimationFrame mainLoop, canvas
    return

  # początkowe pozycje elementów
  init = ->
    player.x = player.width
    player.y = (H - (player.height)) / 2
    ai.x = W - (player.width + ai.width)
    ai.y = (H - (ai.height)) / 2
    ball.serve 1
    return

  # aktualizujemy elementy
  update = ->
    ball.update()
    player.update()
    ai.update()
    
    colors = ['pink', 'red', 'blue', 'white', 'black', 'green', 'violet']
    
    if counter > 1
      $('body').css 'background-color', colors[Math.floor(Math.random() * colors.length)]
      counter = 0
    
    counter++
    
  draw = ->
    ctx.fillStyle = 'violet'
    ctx.fillRect 0, 0, W, H
    ctx.save()
    ctx.fillStyle = 'pink'
    ball.draw()
    player.draw()
    ai.draw()

    ctx.restore()

  main()
  
  audio = new Audio 'muzyczka.mp3'
  audio.play()