require 'ruby2d'
require_relative 'paddle.rb'
require_relative 'ball.rb'
require_relative 'ai_paddle.rb'

width = 800
height = 600

set width: width, height: height, title: "Pong"

player = Paddle.new(width: 10, height: 50, color: 'white', x: 0, y: 225)
ai = AI_Paddle.new(width: 10, height: 50, color: 'blue', x: 790, y: 225)
ball = Ball.new(x: 400, y: 250, radius: 10, color: 'red', boundary_width: width, boundary_height: height, speed: 5)

solid_objects = [player]

direction = 0

on :key_down do |event|
  if event.key == 'up'
    direction = 1
  elsif event.key == 'down'
    direction = -1
  end
end

on :key_up do |event|
  if event.key == 'up' || event.key == 'down'
    direction = 0
  end
end

update do
  player.move_up if direction == 1
  player.move_down if direction == -1
  ai.update(ball)
  ball.update(solid_objects)
end

show