require './lib/game'

game_board = GameBoard.new 
player1 = User.new(game_board)
player2 = Computer.new(game_board)
game = Game.new(game_board, player1, player2)
game.start
