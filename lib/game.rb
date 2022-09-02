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
        @game_board.place_game_piece(@player1.select_column, @player1)
        puts @game_board.render_game_board
        #check_for_winner
        #game_board_full?
        @game_board.place_game_piece(@player2.select_column, @player2)
        puts @game_board.render_game_board
        #check_for_winner
        #game_board_full?
        turn 
    end
end

game_board = GameBoard.new 
player1 = User.new(game_board)
player2 = Computer.new(game_board)
game = Game.new(game_board, player1, player2)

game.turn