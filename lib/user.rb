require './lib/game_board'

class User 
    attr_reader :game_piece, :game_board

    def initialize(game_board)
        @game_piece = 'x'
        @game_board = game_board 
    end

    def select_column
        puts 'Select your column'
        choice = gets.chomp.upcase

        if choice == 'A'
            column = game_board.a_column
        elsif choice == 'B'
            column = game_board.b_column
        elsif choice == 'C'
            column = game_board.c_column
        elsif choice == 'D'
            column = game_board.d_column
        elsif choice == 'E'
            column = game_board.e_column
        elsif choice == 'F'
            column = game_board.f_column
        elsif choice == 'G'
            column = game_board.g_column
        else
            puts 'That is not a valid column choice'
            puts 'Enter A-G only'
            return select_column
        end

        if @game_board.valid_column?(column) == true
            return column
        else
            puts 'There are no spaces left in that column'
            puts 'Please enter a different column choice'
        end 
        select_column
    end
end 

# game_board = GameBoard.new 
# user = User.new(game_board)
# game_board.drop_piece(user.select_column)
# game_board.drop_piece(computer.select_column)
# puts game_board.render 