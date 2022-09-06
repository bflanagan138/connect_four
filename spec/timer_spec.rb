require 'rspec'
require './lib/timer'

RSpec.describe Timer do 
    it 'times the game' do 
        timer = Timer.new 
        timer.start = 0
        timer.stop = 100
        expect(timer.elapsed_time).to eq(100)
    end
end

