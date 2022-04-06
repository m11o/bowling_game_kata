module D20220405
  class Game
    attr_reader :score

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
      roll_index = 0
      score = 0
      10.times do

      end
    end
  end
end

