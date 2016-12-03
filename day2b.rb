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
  keypad = [[nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, "1", nil, nil],
            [nil, nil, "2", "3", "4", nil],
            [nil, "5", "6", "7", "8", "9"],
            [nil, nil, "A", "B", "C", nil],
            [nil, nil, nil, "D", nil, nil]]
  current_button = [1, 3]
  code_buttons = []
  lines.each do |line|
    line.each do |char|
      next_button = case char
                      when "U" then [current_button[0], current_button[1] - 1]
                      when "D" then [current_button[0], current_button[1] + 1]
                      when "L" then [current_button[0] - 1, current_button[1]]
                      when "R" then [current_button[0] + 1, current_button[1]]
                    end

      # Ensures the command doesn't move us off the keypad.
      current_button = next_button unless keypad[next_button[1]].nil? || keypad[next_button[1]][next_button[0]].nil?
    end
    code_buttons << keypad[current_button[1]][current_button[0]]
  end
  "The buttons are #{code_buttons.join(", ")}."
end

puts bathroom_code(lines: receive_puzzle_input)
