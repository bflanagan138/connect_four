require './lib/game_board'

class User 
    attr_reader :game_piece, :game_board

    def initialize(game_board)
        @game_piece = 'x'
        @game_board = game_board 
    end

    def select_column
        choice = gets.chomp  
        if @game_board.valid_column? == true
            if choice.upcase == 'A'
                return game_board.a_column
            elsif choice.upcase == 'B'
                return game_board.b_column
            elsif choice.upcase == 'C'
                return game_board.c_column
            elsif choice.upcase == 'D'
                return game_board.d_column
            elsif choice.upcase == 'E'
                return game_board.e_column
            elsif choice.upcase == 'F'
                return game_board.f_column
            elsif choice.upcase == 'G'
                return game_board.g_column
            end
        else
            puts 'Try again'
        end 
        select_column
    end
end 

game_board = GameBoard.new 
user = User.new(game_board)
puts user.select_column