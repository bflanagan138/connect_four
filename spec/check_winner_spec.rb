require 'rspec'
require './lib/check_winner'
require './lib/game_board'
require './lib/user'
require './lib/computer'

RSpec.describe CheckWinner do  
    describe '#initialize' do 
        it 'has a gameboard' do 
            game_board = GameBoard.new
            user = User.new(game_board)
            check_winner = CheckWinner.new(user, game_board)

            expect(check_winner.game_board).to be_a GameBoard
        end 
        it 'has a player' do 
            game_board = GameBoard.new
            user = User.new(game_board)
            check_winner = CheckWinner.new(user, game_board)

            expect(check_winner.player).to be_a User 
        end 
        it 'can have a computer player' do 
            game_board = GameBoard.new
            computer = Computer.new(game_board)
            check_winner = CheckWinner.new(computer, game_board)

            expect(check_winner.player).to be_a Computer 
        end
    end 
end 