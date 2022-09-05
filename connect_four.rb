require './lib/game'
require './lib/user'
require './lib/game_board'
require './lib/computer'

game_board = GameBoard.new 
player1 = User.new(game_board)
player2 = Computer.new(game_board)
game = Game.new(game_board, player1, player2)
game.start