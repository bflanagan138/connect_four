require './lib/game_board'
require './lib/user'
require './lib/check_winner'
require './lib/leader_board'
require './lib/timer'

class Game 
    attr_reader :game_board, :player1, :player2

    def initialize(game_board, player1, player2)
        @game_board = game_board
        @player1 = player1 
        @player2 = player2 
        @timer = Timer.new
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
        puts 'Enter (p) to play, (q) to quit, (l) to see leaderboard'

        user_input = gets.chomp.downcase

        until user_input == 'p' || user_input == 'q' || user_input == '(p)' || user_input == '(q)' || user_input == '(l)' || user_input == 'l' 
            puts 'Try again!'
            user_input = gets.chomp.downcase
        end 

        if user_input == 'p' || user_input == '(p)'
            puts `clear`
            one_or_two_player_game
            @timer.start_timer
            turn
        elsif user_input == 'q' || user_input == '(q)'
            puts "Goodbye"
        elsif user_input == 'l' || user_input == '(l)'
            leader_board = LeaderBoard.new 
            leader_board.display_leaderboard
            puts "Hit RETURN key to return to Main Menu"
            gets.chomp
            start 
        end
    end

    def one_or_two_player_game
        puts 'Enter 1 for one player, enter 2 for two players'
        user_input = gets.chomp.to_i
        if user_input == 1 
            puts 'Enter player 1 name:'
            @player1.name = gets.chomp
            puts `clear`
        elsif user_input == 2
            puts 'Enter player 1 name:'
            @player1.name = gets.chomp
            puts 'Enter player 2 name:'
            @player2.name = gets.chomp
            puts `clear`
            @player2.human = true 
        end
    end

    def turn
        puts @game_board.render_game_board
        puts ' '
        @game_board.place_game_piece(@player1.select_column, @player1)
        if CheckWinner.new(@player1, @game_board).check_for_winner?
            puts `clear`
            puts @game_board.render_game_board
            @timer.stop_timer 
            puts "#{player1.name} wins! Hit RETURN key to continue"
            @player1.write_stats(true)
            @player2.write_stats(false)
            gets.chomp
            return game_over
        end

        puts `clear`
        puts @game_board.render_game_board
        puts ' '
        @game_board.place_game_piece(@player2.select_column, @player2)
        if CheckWinner.new(@player2, @game_board).check_for_winner?
            puts `clear`
            puts @game_board.render_game_board
            @timer.stop_timer
            puts "#{@player2.name} wins! Hit RETURN key to continue"
            @player1.write_stats(false)
            @player2.write_stats(true)
            gets.chomp
            return game_over
        end
        puts `clear`
        

        if @game_board.game_board_full?
            puts 'There are no more moves. Hit RETURN key to continue'
            @timer.stop_timer
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
        puts "It took #{@timer.elapsed_time} seconds to play game"
        puts "Hit RETURN key to return to MAIN MENU"
        gets.chomp
        game_board = GameBoard.new 
        player1 = User.new(game_board, 'x')
        player2 = User.new(game_board, 'o', false)
        game = Game.new(game_board, player1, player2)
        game.start
    end
end
