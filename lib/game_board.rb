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

        go = gets.chomp

        until go.downcase == 'p' || go.downcase == 'q' || go == '(p)' || go == '(q)'
            puts 'Try again!'
            go = gets.chomp
        end 

        if go.downcase == 'p' || go == '(p)'
            return print_game_board
        elsif go.downcase == 'q' || go == '(q)'
            return puts "Goodbye"
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


    def place_piece
        column = user.select_column
        if valid_column?(column)
            #write code that puts piece at bottom of column
        else 
            #write code that says 'try again' and restarts method
        end
    end


    def print_game_board 
        puts "ABCDEFG"
        6.times do |i| 
            print @a_column[5-i]
            print @b_column[5-i]
            print @c_column[5-i]
            print @d_column[5-i]
            print @e_column[5-i]
            print @f_column[5-i]
            print @g_column[5-i]
            puts ""
        end
    end
end
# game_board = GameBoard.new()
# game_board.welcome_screen
# game_board.print_game_board