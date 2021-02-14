class TicTacToe #build TicTacToe class

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  #assigns instance variable @board to an array with 9 blank spaces

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
  #define all the possible win combinations and set it equal to a nested array
  #this is a helper method

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  #define a method that prints the current board based on the @board
  #instace varaiable

  def input_to_index(input)
    input.to_i-1
  end
  #accepts the user's input (a string) as an argument
  #converts the user's input (a string) into an integer
  #converts the user's input from the user-friendly format (on a 1-9 scale)
  #to the array-friendly
  #format (where the first index starts at 0)

  def move(index, player_token = "X")
    @board[index] = player_token
  end
  #must taken in the index of the board and player's token
  #should default to "X"

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  #returns true or false based on if the position is taken

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  #checks is it is within bounds of game
  #checks whether postion is taken

  def turn_count
    @board.count {|player_token| player_token == "X" || player_token == "O"}
  end
  #return the number of turns have been played = occupied positions

  def current_player
    turn_count % 2 == 0 ? "X":"O"
  end
  #should use turn count to determines whose turn it is

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  #receives user input via the gets method
  #calls #input_to_index, #valid_move?, and #current_player
  #makes valid moves and displays the board
  #asks for input again after a failed validation

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  #returns false for draw
  #use win combinations constant

  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end
  #return true if every space is either x or o

  def draw?
    full? && !won?
  end
  #returns true if board is full and game has not been won

  def over?
    won? || draw?
  end
  #return true if board is won or full

  def winner
    if won?
      return @board[won?[0]]
    end
  end
  #give @board the winer method should return token "X" or "O"

  def play
    turn until over?
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
   end
     #responsible for game loop use helper methods! 
     #asks for players input on a turn of the game
     #checks if the game is over after every turn
     #plays the first turn of the game
     #plays the first few turns of the game
      #checks if the game is won after every turn
      #checks if the game is draw after every turn
      #stops playing if someone has won
      #congratulates the winner X
      #congratulates the winner O
      #stops playing in a draw
      #prints "Cat's Game!" on a draw
      #plays through an entire game
  end
