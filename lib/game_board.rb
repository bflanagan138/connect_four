class GameBoard 
    attr_reader :a_column, :b_column, :c_column, :d_column, :e_column, :f_column, :g_column
    def initialize
        @a_column = [".", ".", ".", ".", ".", "."]
        @b_column = [".", ".", ".", ".", ".", "."]
        @c_column = [".", ".", ".", ".", ".", "."]
        @d_column = [".", ".", ".", ".", ".", "."]
        @e_column = [".", ".", ".", ".", ".", "."]
        @f_column = [".", ".", ".", ".", ".", "."]
        @g_column = [".", ".", ".", ".", ".", "."]
        #Refactor into individual Cells if necessary (Cell class)
    end

    def welcome_screen
        puts `clear`
        puts "xoxoxoxo Welcome to Connect 4! oxoxoxox" 
        puts "Test your intelligence against our super computer!"
        puts "Type (p) to start the game. Type (q) to quit."

        user_input = gets.chomp.downcase

        until user_input == 'p' || user_input == 'q' || user_input == '(p)' || user_input == '(q)'
            puts 'Try again!'
            user_input = gets.chomp.downcase
        end 

        if user_input == 'p' || user_input == '(p)'
            puts render_game_board
        elsif user_input == 'q' || user_input == '(q)'
            puts "Goodbye"
        end
    end

    def valid_column?(column)
        #makes sure users selection is a valid column
        column.include?('.')
    end 

    #figure out who player is
    #select column
    #check if column valid
    #places the piece 
    #checks for winner


    # def place_game_piece(column)
    def place_game_piece(column, player)
        # if player == player1 
            column[column.index(".")] = player.game_piece
        # else
        #     column[column.index(".")] = ('o')
        # end 
    end

    def render_game_board
        render = "ABCDEFG\n"
        6.times do |i| 
            render.concat ( @a_column[5-i] )
            render.concat ( @b_column[5-i] )
            render.concat ( @c_column[5-i] )
            render.concat ( @d_column[5-i] )
            render.concat ( @e_column[5-i] )
            render.concat ( @f_column[5-i] )
            render.concat ( @g_column[5-i] )
            render.concat ("\n")
        end
        render
    end
end

# game_board = GameBoard.new
# game_board.welcome_screen