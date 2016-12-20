function love.load()
love.mouse.setVisible(false)
dots_sinus = {}
dots_cosinus = {}
x = 0
r = 123
g = 206
b =  5
screenW, screenH = love.graphics.getDimensions()
screenWMid, screenHMid = screenW / 2, screenH / 2
speed = 1500
radius = 500
lineDiff = 200
end

function love.draw()
	for i=1,#dots_cosinus do
		love.graphics.setColor(
			dots_sinus[i][3],
			dots_sinus[i][4],
			dots_sinus[i][5])
		if i > lineDiff then
			j = i - lineDiff
		else
			j = i
		end
		love.graphics.line(
			screenWMid + dots_sinus[i][2], 
			screenHMid + dots_cosinus[i][2],
			screenWMid + dots_sinus[j][2] + 1,
			screenHMid + dots_cosinus[j][2])
	end

end

function love.update(dt)
	x = x + dt * speed
	alpha = x / screenWMid * math.pi
	y = math.sin(alpha) * radius
	setRandomColor()
	table.insert(dots_sinus, {x, y, r, g, b})

	beta = x / screenHMid * math.pi
	y = math.cos(alpha) * radius
	table.insert(dots_cosinus, {x, y, g, b, r})

	if alpha > 2*math.pi then
		radius = radius + 5
		x=0
	end
end
function love.keypressed(k)
	if k == 'escape' then
		love.event.quit()
	end
end
function setRandomColor()
	r = love.math.random(255)
	g = love.math.random(255)
	b = love.math.random(255)
end
