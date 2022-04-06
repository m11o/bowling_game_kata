#!/usr/bin/env ruby

require 'time'

now = Time.new
formatted_now = now.strftime('%Y%m%d')

ROOT_PATH = __dir__ + '/..'
GAME_SCRIPT_TEMPLATE = <<~"EOH"
  module D#{formatted_now}
    class Game
    end
  end
EOH
GAME_SPEC_TEMPLATE = <<~"EOH"
  require_relative '../spec/spec_helper'
  require_relative '../#{formatted_now}/game'

  module D#{formatted_now}
    describe '#{formatted_now}' do
    end
  end
EOH

now_dir_name = ROOT_PATH + '/' + formatted_now
Dir.mkdir(now_dir_name) unless Dir.exist?(now_dir_name)

File.open(now_dir_name + '/game.rb', 'w+') do |f|
  f.write(GAME_SCRIPT_TEMPLATE)
end
File.open(now_dir_name + '/game_spec.rb', 'w+') do |f|
  f.write(GAME_SPEC_TEMPLATE)
end
