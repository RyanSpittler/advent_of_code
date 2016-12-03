def receive_puzzle_input
  lines = []
  while true
    puts "Please enter a line of puzzle input. Type 'end' to finish entering lines of commands."
    input = gets.chomp
    break if input == "end"
    lines << input.chars
  end
  lines
end

def bathroom_code(lines:)
  keypad = [[1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]]
  current_x = 1
  current_y = 1
  buttons = []
  lines.each do |line|
    line.each do |char|
      case char
        when "U" then current_y -= 1
        when "D" then current_y += 1
        when "L" then current_x -= 1
        when "R" then current_x += 1
      end

      # Ensures the command doesn't move us off the keypad.
      current_y = [[current_y, 2].min, 0].max
      current_x = [[current_x, 2].min, 0].max
    end
    buttons << keypad[current_y][current_x]
  end
  "The buttons are #{buttons.join(", ")}."
end

puts bathroom_code(lines: receive_puzzle_input)
