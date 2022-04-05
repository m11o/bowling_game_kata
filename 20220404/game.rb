module D20220404
  class Game
    def initialize
      @score = 0
      @rolls = []
      @current_roll = 0
    end

    def roll(pins)
      @rolls[@current_roll] = pins
      @current_roll += 1
    end

    def score
      score = 0
      roll_index = 0
      10.times do
        frame_score = @rolls[roll_index] + @rolls[roll_index + 1]
        if spare? roll_index
          score += frame_score + @rolls[roll_index + 2]
        else
          score += frame_score
        end
        roll_index += 2
      end
      score
    end

    private

    def spare?(roll_index)
      (@rolls[roll_index] + @rolls[roll_index + 1]) == 10
    end
  end
end
