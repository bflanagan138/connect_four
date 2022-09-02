class CheckWinner
    attr_reader :game_board, :player 

    def initialize(player, game_board)
        @player = player 
        @game_board = game_board
    end 
end