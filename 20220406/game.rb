module D20220406
  class Game
    ALL_FRAMES = 10

    def initialize
      @rolls = []
      @current_frame = 0
    end

    def roll(pins)
      @rolls[@current_frame] = pins
      @current_frame += 1
    end

    def score
      score = 0
      roll_index = 0
      ALL_FRAMES.times do
        if strike?(roll_index)
          score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
          roll_index += 1
        elsif spare?(roll_index)
          score += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
          roll_index += 2
        else
          score += @rolls[roll_index] + @rolls[roll_index + 1]
          roll_index += 2
        end
      end
      score
    end

    private

    def spare?(roll_index)
      @rolls[roll_index] + @rolls[roll_index + 1] == 10
    end

    def strike?(roll_index)
      @rolls[roll_index] == 10
    end
  end
end
