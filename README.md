Methods to Update/Cleanup
- game_board ln46 'place_game_piece'
- game_board ln50 'render'
- game_board ln20 in 'welcome_screen' change variable name go to something more descriptive


in user.rb 'select_column'
- move .upcase methods to line 13
- clarify 'Try again' error messages for user


Create Game class
- has both players and gameboard as attributes
- move welcome screen from GameBoard to Game class
- has 'start' method that displays welcome screen and then loops through the players turns, breaking loop when a 'check_for_winner' method returns true

Create Computer class
- similar initialize to User class, but has game_piece = 'o'
- has 'select_column' method that randomly picks a column ( ('a'..'g').to_a.sample )