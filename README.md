array.each_cons(2).all? { |a,b| b == a + 1 }

 ABCDEFG
6.......
5.......
4...x...
3..x....
2.x.....
1x......

diagonal_string 'xxxx..'

row = a1(.) b1(.) c1(.) d1(x) e1(.) f1(.) g1(.)

row.to_string
row_string = '...x...'
row_string.include?('xxxx')



diagonals(cell)
    cell.previous_column, cell.next_row
    cell.next_column, cell.next_row
end 

diagonals
- only test rows above 4
- .each_with_index
.each_with_index do |column, i|

d_column.to_s.include?('xxxx')

rows 4,5,6.find_all ( player.gamepiece )
    if x is in column d 
        test diagonal down right 
        test diagonal down left 

    elsif x is in columns a-c
        test diagonal down right
        start 
        4 times do 
            is (column+1)(row-1) also player.gamepiece?
        end 

    elsif x is in columns e-g
        test diagonal down left
        start 
        4 times do 
            is (column-1)(row-1) also player.gamepiece?
        end 
    end 
end 


class CheckWinner
    initialize
    end 

    def run_check(player)
        check_rows
        if player.gamepiece.any? (above row 4,5,6 )

            rows_above_456 = rows 4,5,6.find_all ( player.gamepiece )

            rows_above_456.each do
                check_columns
                check_diagonals
            end
        end 
        return true or false
    end 

    def check_rows
    end 

    def check_columns
    end 

    def check_diagonals
    end 
end 