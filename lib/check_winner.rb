require 'pry'

class CheckWinner
    attr_reader :game_board, :player 

    def initialize(player, game_board)
        @player = player 
        @game_board = game_board
    end 

    def check_row
        6.times do |i|   
            row = ''    
            @game_board.columns.each do |column|
                row.concat(column[i])
            end
            if row.include?('xxxx') || row.include?('oooo') 
                return true
            end
        end 
    end

    def check_column
        @game_board.columns.each do |column|
            if column.join.include?('xxxx') || column.join.include?('oooo')
                return true 
            end 
        end
    end
end

