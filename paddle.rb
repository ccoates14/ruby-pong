class Paddle

  def initialize(width:, height:, color:, x:, y:, speed: 10)
    @speed = speed
    @paddle_shape = Rectangle.new(x: x, y: y, width: width, height: height, color: color)
  end

  def move_up
    @paddle_shape.y -= @speed
  end

  def move_down
    @paddle_shape.y += @speed
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
end