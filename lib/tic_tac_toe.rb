WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(user_input)
  converted_input = user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
board[index] != " "
end

def valid_move?(board, index)
 if index.between?(0, 8)
   if !position_taken?(board, index) 
     true
   end
 end
end

def turn(board)
  puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
if valid_move?(board, index)
move(board, index, character = "X")
display_board(board)
else
turn(board)
end
end

def turn_count(board)
   counter = 0
   board.each do |spaces|
      if spaces == "X" || spaces == "O"
         counter += 1
      end
   end
   counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
 WIN_COMBINATIONS.detect do |win_combination|
   #binding.pry
  board[win_combination[0]] == board[win_combination[1]] &&
  board[win_combination[1]] == board[win_combination[2]] && 
  position_taken?(board, win_combination[0])
end
end

def full?(board)
   board.all? do |spaces| spaces == "X" || spaces == "O"end
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
 if won?(board)
  return board[won?(board)[0]]
end
end

def play(board)
  counter = 0
  until counter == 8
    turn(board)
    counter += 1
end
end