require 'rspec'
require './lib/user'
require './lib/game_board'

RSpec.describe do 
    describe '#initialize' do 
        it 'is xs or os' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.game_piece).to eq('x')
        end
        it 'has a game board' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.game_board).to be_an_instance_of GameBoard
        end 
    end
    describe '#method' do
        it 'selects a column' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.select_column).to eq(game_board.a_column)
        end 
        xit 'returns column selection' do 
            user = User.new
        end 
    end 
end 