require 'rspec'
require './lib/game_board'

RSpec.describe do
    describe "#initialize" do
        it "has an empty column" do
            game_board = GameBoard.new()
            expect(game_board.a_column.all? { |string| string == "." }).to eq (true)
        end
    end
end