class Paddle

  def initialize(width:, height:, color:, x:, y:, screen_height:, speed: 10)
    @speed = speed
    @screen_height = screen_height
    @paddle_shape = Rectangle.new(x: x, y: y, width: width, height: height, color: color)
  end

  def move_up
    @paddle_shape.y -= @speed if !collided_wall_top?
  end

  def move_down
    @paddle_shape.y += @speed if !collided_wall_bottom?
  end

  def x
    @paddle_shape.x
  end

  def y
    @paddle_shape.y
  end

  def width
    @paddle_shape.width
  end

  def height
    @paddle_shape.height
  end

  def collided_wall_top?
    @paddle_shape.y <= 0
  end

  def collided_wall_bottom?
    @paddle_shape.y + @paddle_shape.height >= @screen_height
  end
end