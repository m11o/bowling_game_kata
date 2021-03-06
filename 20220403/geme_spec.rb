require_relative '../spec/spec_helper'
require_relative '../20220403/game.rb'

module D20220403
  describe '20220403' do
    before do
      @game = Game.new
    end

    def roll_many(n, pins)
      n.times do
        @game.roll(pins)
      end
    end

    def roll_spare
      @game.roll(5)
      @game.roll(5)
    end

    def roll_strike
      @game.roll(10)
    end

    it 'all gutter' do
      roll_many(20, 0)
      expect(@game.score).to eq 0
    end

    it 'all one points' do
      roll_many(20, 1)
      expect(@game.score).to eq 20
    end

    it 'when one spare' do
      roll_spare
      @game.roll(3)
      roll_many(17, 0)
      expect(@game.score).to eq 16
    end

    it 'when one strike' do
      roll_strike
      @game.roll(3)
      @game.roll(4)
      roll_many(16, 0)
      expect(@game.score).to eq 24
    end

    it 'when perfect' do
      roll_many(12, 10)
      expect(@game.score).to eq 300
    end
  end
end
