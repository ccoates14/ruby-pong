class Score_Board
  def initialize
    @left_score = 0
    @right_score = 0
    @left_score_text = Text.new(@left_score.to_s, x: 200, y: 50, size: 40)
    @right_score_text = Text.new(@right_score.to_s, x: 600, y: 50, size: 40)
  end

  def add_to_left_player
    @left_score += 1
    @left_score_text.text = @left_score.to_s
  end

  def add_to_right_player
    @right_score += 1
    @right_score_text.text = @right_score.to_s
  end
end