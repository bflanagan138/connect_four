require './lib/game'
require './lib/user'
require './lib/game_board'


game_board = GameBoard.new 
player1 = User.new(game_board, 'x')
player2 = User.new(game_board, 'o', false)
game = Game.new(game_board, player1, player2)
game.start