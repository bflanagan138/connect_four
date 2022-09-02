require './lib/game_board'
require './lib/user'
require './lib/computer'

class Game 
    attr_reader :game_board, :player1, :player2

    def initialize(game_board, player1, player2)
        @game_board = game_board
        @player1 = player1 
        @player2 = player2 
    end

    def start 
        puts `clear`
        puts `clear`
        puts"                        _____  "
        puts"                     / /  |  | "
        puts"                    / /   |  |_"
        puts"___________________/ /    ^   /"
        puts" _  _  _  _  _  ____ \\____   | "
        puts"|_ |_|| || ||/_|_ |       |__|"
        puts"==============================="
        puts' '
        puts '==== Welcome! ==== '
        puts 'Test your intelligence against our supercomputer.'
        puts 'Enter (p) to play, (q) to quit'

        user_input = gets.chomp.downcase

        until user_input == 'p' || user_input == 'q' || user_input == '(p)' || user_input == '(q)'
            puts 'Try again!'
            user_input = gets.chomp.downcase
        end 

        if user_input == 'p' || user_input == '(p)'
            puts `clear`
            turn
        elsif user_input == 'q' || user_input == '(q)'
            puts "Goodbye"
        end
    end

    #player1 goes first
    #select column
    #check if column valid
    #places the piece 
    #checks for winner
    #player2 goes second
    #select column
    #check if column valid
    #places the piece 
    #checks for winner

    def turn
        puts @game_board.render_game_board
        puts ' '
        @game_board.place_game_piece(@player1.select_column, @player1)
        #check_for_winner(user)

        @game_board.place_game_piece(@player2.select_column, @player2)

        # puts @game_board.render_game_board
        #check_for_winner(computer)
        puts `clear`

        if @game_board.game_board_full?
            puts 'There are no more moves. Game Over.'
            #figure out what happens after game over
        elsif
            turn
        end 
    end
end

game_board = GameBoard.new 
player1 = User.new(game_board)
player2 = Computer.new(game_board)
game = Game.new(game_board, player1, player2)

game.start