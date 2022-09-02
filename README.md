array.each_cons(2).all? { |a,b| b == a + 1 }

 ABCDEFG
6.......
5.......
4...x...
3..x....
2.x.....
1.......

diagonal_string 'xxxx..'

row = a1(.) b1(.) c1(.) d1(x) e1(.) f1(.) g1(.)
row.to_string
row_string = '...x...'
row_string.include?('xxxx')

d_column.to_s.include?('xxxx')

diagonals(cell)
    cell.previous_column, cell.next_row
    cell.next_column, cell.next_row
end 

