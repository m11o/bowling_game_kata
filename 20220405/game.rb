module D20220405
  class Game
    attr_reader :score

    def initialize
      @score = 0
    end

    def roll(pins)
      @score += pins
    end
  end
end

