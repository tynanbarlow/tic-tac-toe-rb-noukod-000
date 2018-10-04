
class String
  def numeric?
    Float(self) != nil rescue false
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  player_turn = 1
  while player_turn != 10 do
    turn(board)
    player_turn += 1
    puts player_turn
    #if over?
      #then
      #if won?
        #then
        #puts "Congratulations! The player using #{winner(board)} has won the game."
      #elsif draw?
        #then
        #puts "It looks the game is a draw! Neither player has won or lost."
      #end
      #puts "Would you like to play again? (Y/N)"
      #play_again = gets
      #if play_again == "Y" || "y"
        #then
        #play(board)
      #elsif repeat == "N" || "n"
        #puts "Come play again!"
        #player_turn = 10
      #end
    #end
  end
end

def turn(board)
  display_board(board)
  puts "Where would you like to go?"
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  while valid_move?(board, index) == false
    puts "Please enter a space that is not already occupied:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
  value = current_player(board)
  move(board, index, value)
  display_board(board)
end

def input_to_index(user_input)
  if user_input.numeric?
    then
      while user_input.to_i < 1 or user_input.to_i > 9
        puts "That is not a valid input. Please choose a number between 1 and 9:"
        user_input = gets.strip
      end
      return user_input.to_i - 1
    else
      return -1
    end
end

def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  else
    if index <= 8 && index >= 0
      return true
    else
      return false
    end
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == nil || board[index] == ""  then
    return false
  elsif board[index] == "X" || board[index] == "O" then
    return true
  end
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def turn_count(board)
  filled = 0
  board.each do |spot|
  if spot == "X" || spot == "O"
    then
    filled += 1
    end
  end
  return filled
end

def move(board, index, value)
  board[index] = value
end



WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
      else
        false
      end
  end
  if false
    return false
  end
end

def full?(board)
  board.all? {|space| space == "X" || space == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O"
    else
      false
    end
  end
  if false
    return false
  end
end
