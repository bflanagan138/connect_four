require 'rspec'
require './lib/game_board'
require './lib/user'
require './lib/computer'
require './lib/game'

RSpec.describe Game do
    describe '#initialize' do 
        it 'has a game board' do 
            game_board = GameBoard.new
            player1 = User.new(game_board, 'x')
            player2 = User.new(game_board, 'o')
            game = Game.new(game_board, player1, player2)
            
            expect(game_board).to be_a GameBoard
            expect(player1).to be_a User 
            expect(player2).to be_a User
        end
    end
end


