require 'rspec'
require './lib/computer'
require './lib/game_board'

RSpec.describe do 
    describe '#initialize' do 
        it 'has a game piece' do 
            game_board = GameBoard.new 
            computer = Computer.new(game_board)
            expect(computer.game_piece).to eq('o')
        end
        it 'has a game board' do 
            game_board = GameBoard.new 
            computer = Computer.new(game_board)
            expect(computer.game_board).to be_an_instance_of GameBoard
        end 
    end
end