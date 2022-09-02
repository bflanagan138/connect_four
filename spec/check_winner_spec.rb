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

    describe '#check_row' do 
        it 'returns true if there are 4 consecutive user gamepieces in first row' do 
            game_board = GameBoard.new
            user = User.new(game_board)
            check_winner = CheckWinner.new(user, game_board)

            game_board.place_game_piece(game_board.a_column, user)
            game_board.place_game_piece(game_board.b_column, user)
            game_board.place_game_piece(game_board.c_column, user)
            game_board.place_game_piece(game_board.d_column, user)

            expect(check_winner.check_row).to eq true 
        end
        it 'still returns true if 4 consecutive computer gamepieces in second row' do 
            game_board = GameBoard.new
            user = User.new(game_board)
            computer = Computer.new(game_board)
            check_winner = CheckWinner.new(user, game_board)

            game_board.place_game_piece(game_board.a_column, user)
            game_board.place_game_piece(game_board.b_column, user)
            game_board.place_game_piece(game_board.c_column, user)
            game_board.place_game_piece(game_board.d_column, computer)

            game_board.place_game_piece(game_board.a_column, computer)
            game_board.place_game_piece(game_board.b_column, computer)
            game_board.place_game_piece(game_board.c_column, computer)
            game_board.place_game_piece(game_board.d_column, computer)

            expect(check_winner.check_row).to eq true 
        end
        
    end

    describe '#check_column' do 
        it 'returns true if there are 4 consecutive user gamepieces in first column' do 
            game_board = GameBoard.new
            user = User.new(game_board)
            check_winner = CheckWinner.new(user, game_board)

            game_board.place_game_piece(game_board.a_column, user)
            game_board.place_game_piece(game_board.a_column, user)
            game_board.place_game_piece(game_board.a_column, user)
            game_board.place_game_piece(game_board.a_column, user)

            expect(check_winner.check_column).to eq true 
        end
        it 'still returns true if 4 consecutive computer gamepieces in a different column' do 
            game_board = GameBoard.new
            computer = Computer.new(game_board)
            check_winner = CheckWinner.new(computer, game_board)

            game_board.place_game_piece(game_board.a_column, computer)
            game_board.place_game_piece(game_board.a_column, computer)
            game_board.place_game_piece(game_board.a_column, computer)
            game_board.place_game_piece(game_board.a_column, computer)

            expect(check_winner.check_column).to eq true 
        end
    end

    describe '#check_diagonal' do 
    end 
end 