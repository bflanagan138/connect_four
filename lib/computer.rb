class Computer
    attr_reader :game_piece, :game_board

    def initialize(game_board)
        @game_piece = 'o'
        @game_board = game_board 
    end

    def select_column
        puts 'What column would you like?'
        choice = ( ('A'..'G').to_a.sample )

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
            return select_column
        end

        if @game_board.valid_column?(column) == true
            return column
        end 
        select_column
    end
end 