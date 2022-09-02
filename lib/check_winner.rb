require 'pry'

class CheckWinner
    attr_reader :game_board, :player 

    def initialize(player, game_board)
        @player = player 
        @game_board = game_board
    end 

    def check_row
        row1 = ''
        row2 = ''
        row3 = ''
        row4 = ''
        row5 = ''
        row6 = ''
        @game_board.columns.each do |column|
            row1.concat(column[0])
            row2.concat(column[1])
            row3.concat(column[2])
            row4.concat(column[3])
            row5.concat(column[4])
            row6.concat(column[5])
        end
        
        [row1,row2,row3,row4,row5,row6].any? do |row|
            row.include?('xxxx') || row.include?('oooo') 
        end 
    end
end