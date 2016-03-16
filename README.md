# Ruby Chess

Play chess in your terminal! Created with Ruby.

![Ruby Chess](/lib/images/chessStart.png?raw=true "Ruby Chess")

## How to run

In order to run, make sure you have ruby installed on your machine. Then simply download this repo, unzip, navigate to the ruby_chess folder in your terminal, and type 'ruby game.rb'

![Ruby Chess](/lib/images/terminal.png?raw=true "Ruby Chess")

Grab a friend and play!

![Ruby Chess](/lib/images/chessKnight.png?raw=true "Ruby Chess")

The game will prevent you from moving into check, or moving a piece that would result in you putting yourself into checkmate. This is done using two methods.

Board#in_check? looks at the board, and sees if it is in a state of check (if any piece can move to the position that the opposing team’s king occupies)

![Ruby Chess](/lib/images/in_check.png?raw=true "Ruby Chess")

Piece#move_into_check iterates through a piece’s legal moves before they are returned to the user, and deletes the move from an array of valid_moves if that move would result in the board being in a state of check after the move was performed.

![Ruby Chess](/lib/images/move_into_check.png?raw=true "Ruby Chess")

The game ends when a player has no valid_moves.
