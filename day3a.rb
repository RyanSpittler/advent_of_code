def receive_puzzle_input
  lines = []
  puts "Please enter a line of puzzle input. Type 'end' to finish entering lines of commands."
  while true
    input = gets.chomp
    break if input == "end"
    lines << input.split(" ").map(&:to_i)
  end
  lines
end

def count_triangles(lines:)
  lines.select do |line|
    line[0] + line[1] > line[2] &&
    line[0] + line[2] > line[1] &&
    line[0] < line[1] + line[2]
  end.count
end

puts count_triangles(lines: receive_puzzle_input)
