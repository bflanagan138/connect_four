class GameBoard 
    attr_reader :a_column, :b_column, :c_column, :d_column, :e_column, :f_column, :g_column, :columns
    def initialize
        @a_column = [".", ".", ".", ".", ".", "."]
        @b_column = [".", ".", ".", ".", ".", "."]
        @c_column = [".", ".", ".", ".", ".", "."]
        @d_column = [".", ".", ".", ".", ".", "."]
        @e_column = [".", ".", ".", ".", ".", "."]
        @f_column = [".", ".", ".", ".", ".", "."]
        @g_column = [".", ".", ".", ".", ".", "."]
        @columns = [@a_column, @b_column, @c_column, @d_column, @e_column, @f_column, @g_column]
        #Refactor into individual Cells if necessary (Cell class)
    end

    def valid_column?(column)
        column.include?('.')
    end 

    def place_game_piece(column, player)
            column[column.index(".")] = player.game_piece
    end

    def render_game_board
        render = "A B C D E F G\n"
        6.times do |i| 
            render.concat ( "#{@a_column[5-i]} " )
            render.concat ( "#{@b_column[5-i]} " )
            render.concat ( "#{@c_column[5-i]} ")
            render.concat ( "#{@d_column[5-i]} " )
            render.concat ( "#{@e_column[5-i]} " )
            render.concat ( "#{@f_column[5-i]} " )
            render.concat ( "#{@g_column[5-i]} " )
            render.concat ("\n")
        end
        render
    end

    def game_board_full?
        @columns.none? do |column|
            valid_column?(column)
        end
    end 
        
end