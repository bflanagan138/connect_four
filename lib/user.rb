require './lib/game_board'

class User 
    attr_reader :game_piece, :game_board

    def initialize(game_board)
        @game_piece = 'x'
        @game_board = game_board 
    end

    def select_column
        puts 'What column would you like?'
        choice = gets.chomp

        if choice.upcase == 'A'
            column = game_board.a_column
        elsif choice.upcase == 'B'
            column = game_board.b_column
        elsif choice.upcase == 'C'
            column = game_board.c_column
        elsif choice.upcase == 'D'
            column = game_board.d_column
        elsif choice.upcase == 'E'
            column = game_board.e_column
        elsif choice.upcase == 'F'
            column = game_board.f_column
        elsif choice.upcase == 'G'
            column = game_board.g_column
        else
            puts 'Try again'
            return select_column
        end

        if @game_board.valid_column?(column) == true
            return column
        else
            puts 'Try again'
        end 
        select_column
    end
end 

# game_board = GameBoard.new 
# user = User.new(game_board)
# game_board.drop_piece(user.select_column)
# game_board.drop_piece(computer.select_column)
# puts game_board.render 