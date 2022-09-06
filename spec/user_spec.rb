require 'rspec'
require './lib/user'
require './lib/game_board'

RSpec.describe do 
    describe '#initialize' do 
        it 'has a game piece' do 
            game_board = GameBoard.new 
            user = User.new(game_board, 'x')
            expect(user.game_piece).to eq('x')
        end
        it 'has a game board' do 
            game_board = GameBoard.new 
            user = User.new(game_board, 'x')
            expect(user.game_board).to be_an_instance_of GameBoard
        end 
        it 'has a default name' do 
            game_board = GameBoard.new 
            user = User.new(game_board, 'x')
            expect(user.name).to eq('Player')
        end
        it 'can have a different name' do 
            game_board = GameBoard.new 
            user = User.new(game_board, 'x')
            user.name = 'Jason Vorhees'
            expect(user.name).to eq('Jason Vorhees')
        end
    end 
end 