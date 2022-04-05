require_relative '../spec/spec_helper'
require_relative './game'

describe '20220404' do
  before do
    @game = Game.new
  end

  def roll_many(n, pins)
    n.times do
      @game.roll(pins)
    end
  end

  it 'when all gutters' do
    roll_many(20, 0)
    expect(@game.score).to eq 0
  end

  it 'when all one' do
    roll_many(20, 1)
    expect(@game.score).to eq 20
  end

  it 'when one spare' do
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    roll_many(17, 0)
    expect(@game.score).to eq 16
  end
end
