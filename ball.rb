class Ball
  def initialize(x:, y:, radius:, color:, boundary_width:, boundary_height:, speed: 1)
    @ball_shape = Circle.new(x: x, y: y, radius: radius, color: color)
    @direction_x, @direction_y = randomize_direction
    @speed = speed
    @boundary_width = boundary_width
    @boundary_height = boundary_height
  end

  def update(objects)
    move
    check_collide_with_wall?
    check_collide_with_objects? objects
  end

  def move
    @ball_shape.x += @direction_x * @speed
    @ball_shape.y += @direction_y * @speed
  end

  def randomize_direction
    x, y = rand(-1..1), rand(-1..1)

    if x == 0 || y == 0
      x, y = randomize_direction
    end

    return x, y
  end

  def check_collide_with_objects?(objects)
    objects.each do |object|
      horizontal_collision = @ball_shape.x >= object.x && @ball_shape.x <= object.x + object.width
      vertical_collision = @ball_shape.y >= object.y && @ball_shape.y <= object.y + object.height
      if horizontal_collision && vertical_collision
        #check if ball collided horizontally
        if horizontal_collision
          @direction_x *= -1
        end
        #check if ball collided vertically
        if vertical_collision
          @direction_y *= -1
        end
      end
    end
  end

  def check_collide_with_wall?
    if @ball_shape.x <= 0 || @ball_shape.x >= @boundary_width
      @direction_x *= -1
    end
    if @ball_shape.y <= 0 || @ball_shape.y >= @boundary_height
      @direction_y *= -1
    end
  end

  def x
    @ball_shape.x
  end

  def y
    @ball_shape.y
  end
end