require 'ruby2d'
require_relative 'paddle.rb'
require_relative 'ball.rb'
require_relative 'ai_paddle.rb'
require_relative 'score_board.rb'

width = 800
height = 600

set width: width, height: height, title: "Pong"

player = Paddle.new(width: 10, height: 50, color: 'white', x: 0, y: 225, screen_height: height)
ai = AI_Paddle.new(width: 10, height: 50, color: 'blue', x: 790, y: 225, screen_height: height)
ball = Ball.new(x: 400, y: 250, radius: 10, color: 'green', boundary_width: width, boundary_height: height, speed: 5)
score_board = Score_Board.new

solid_objects = [player]

direction = 0

def update_score(ball, score_board)
  if ball.collided_left_wall?
    score_board.add_to_right_player
    ball.reset_wall_collision
  elsif ball.collided_right_wall?
    score_board.add_to_left_player
    ball.reset_wall_collision
  end
end

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
  update_score(ball, score_board)
end

show