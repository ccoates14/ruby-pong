require_relative 'paddle.rb'
class AI_Paddle
  def initialize(width:, height:, color:, x:, y:, screen_height:, speed: 10)
    @paddle_shape = Paddle.new(width: width, height: height, color: color, x: x, y: y, screen_height: screen_height, speed: speed)
  end

  def update(ball)
    if ball.y > @paddle_shape.y
      @paddle_shape.move_down
    elsif ball.y < @paddle_shape.y
      @paddle_shape.move_up
    end
  end
end