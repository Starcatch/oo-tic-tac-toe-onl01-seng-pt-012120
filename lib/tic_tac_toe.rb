require. "pry" 
class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end 

def move(index, current_player = "X")
  @board[index] = current_player
end 

def position_taken?(index)
   #position_taken?
      #returns true/false based on whether the position on the board is already occupied
  ((@board[index] == "X") || (@board[index] == "O"))
end 

def valid_move?(index)
  #returns true/false based on whether the position is already occupied
  #checks that the attempted move is within the bounds of the game board
    index.between?(0,8) && !position_taken?(index)
end 

def turn_count
  # counts occupied positions
  number_of_turns = 0
  @board.each do |space|
    if space == "X" || space == "O"
      number_of_turns += 1
end 
end 
  number_of_turns
end 

 def current_player
   # returns the correct player, X, for the third move
      #returns the correct player, O, for the fourth move
    if turn_count % 2 == 0
    "X"
    else
    "O"
  end
end 

def turn
  puts "Please enter 1-9:"
  #receives user input via the gets method
  user_input = gets.chomp
  # calls #input_to_index, #valid_move?, and #current_player
  index = input_to_index(user_input)
  #makes valid moves and displays the board
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
         #asks for input again after a failed validation
  else 
    turn
 end 
 end 
 
 def won?
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?
  @board.all? {|taken| taken == "X" || taken == "O"}
end


#Build a method #draw? that returns true if the board is full and has not been won, false if the board is won, and false if the #board is neither won nor full.
def draw?
 !(won?) && (full?)
end 

def over?
  won? || full? || draw?
end 

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
