require './lib/game_board'
require './lib/user'
require './lib/computer'
require './lib/check_winner'

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

    def turn
        puts @game_board.render_game_board
        puts ' '
        @game_board.place_game_piece(@player1.select_column, @player1)
        if CheckWinner.new(@player1, @game_board).check_for_winner?
            puts `clear`
            puts @game_board.render_game_board
            puts "Player 1 wins! Hit RETURN key to continue"
            gets.chomp
            return game_over
        end

        @game_board.place_game_piece(@player2.select_column, @player2)
        if CheckWinner.new(@player2, @game_board).check_for_winner?
            puts `clear`
            puts @game_board.render_game_board
            puts "Player 2 wins! Hit RETURN key to continue"
            gets.chomp
            return game_over
        end
        puts `clear`
        

        if @game_board.game_board_full?
            puts 'There are no more moves. Hit RETURN key to continue'
            gets.chomp
            return game_over
        else 
            turn
        end 
    end

    def game_over
        puts `clear`
        puts " __       _      _    _    __  " 
        puts "|  |     / \\    | \\  / |  |  | "
        puts "|  __   /___\\   |  \\/  |  |__  "
        puts "|  |   /     \\  |      |  |    "   
        puts "|__|  /       \\ |      |  |__| "
        puts "    __           ___   ___    "
        puts "   /  \\ \\     / |   | |   |   "
        puts "  |    | \\   /  |__   |__/    "
        puts "  |    |  \\ /   |     |  \\    "
        puts "   \\__/    v    |___| |   \\   "
        puts ""
        puts "================================"
        puts ""
        puts "Hit RETURN key to return to MAIN MENU"
        gets.chomp
        game_board = GameBoard.new 
        player1 = User.new(game_board)
        player2 = Computer.new(game_board)
        game = Game.new(game_board, player1, player2)
        game.start
    end
end
    game_board = GameBoard.new 
    player1 = User.new(game_board)
    player2 = Computer.new(game_board)
    game = Game.new(game_board, player1, player2)
    game.start
