require 'rspec'
require './lib/user'
require './lib/game_board'

RSpec.describe do 
    describe '#initialize' do 
        it 'has a game piece' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.game_piece).to eq('x')
        end
        it 'has a game board' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.game_board).to be_an_instance_of GameBoard
        end 
        it 'has a default name' do 
            game_board = GameBoard.new 
            user = User.new(game_board)
            expect(user.name).to eq('User')
        end
        it 'can have a different name' do 
            game_board = GameBoard.new 
            user = User.new(game_board, 'Jason Vorhees')
            expect(user.name).to eq('Jason Vorhees')
        end
    end
    #unable to test due to CLI?
    # describe '#method' do
    #     it 'selects a column' do 
    #         game_board = GameBoard.new 
    #         user = User.new(game_board)
    #         expect(user.select_column).to eq(game_board.a_column)
    #     end 
    #     xit 'returns column selection' do 
    #         user = User.new
    #     end 
    # end 
end 